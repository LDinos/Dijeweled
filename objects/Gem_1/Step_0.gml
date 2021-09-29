#region Spinning animation disable
if anim_happening && !spinning //if I am doing the spinning animation, but I am unclicked
{
	if image_index = 0 //wait until i get to the first frame and stop the animation
	{
		if !Gamerule_1.zenify sprite_index = spr_gems //default gem sprite if im not on zenify
		else {sprite_index = spr_zen_gems} //else, use the zen ones
		shadow_index = spr_shadows
		image_speed = 0 //no animation going on, dont animate
		image_index = skinnum //get the correct gem color (0 = red, 1 = white, etc)
		anim_happening = false //animation not happening anymore variable
	}
}
#endregion

if global.OPT_lightallowed {
	if (nearby_glown_left) nearby_glown_left-- //am I glown because of a nearby power gem?
	if (nearby_glown_right) nearby_glown_right--//am I glown because of a nearby power gem?
	if (nearby_glown_up) nearby_glown_up--//am I glown because of a nearby power gem?
	if (nearby_glown_down) nearby_glown_down--//am I glown because of a nearby power gem?
}

#region accspeed and replay slowmo modifier
	var accspeed = 0.6; //default speed acceleration
	modifier = 1; //speed slow-mo modifier. 1 = normal, 2 = half the speed
	if Gamerule_1.isReplay //if I am watching a replay
	{
		accspeed = 0.3 //accelerate half the default acceleration value
		modifier = 2 //also move half as fast
	}
#endregion

#region xmover/ymover and Bomb

if amBomb || amLocked =2 || amLocked = 4 //if I am bomb or doom or skull
{
	if !bombappear && amBomb //if its the first time I appear and I am a bomb
	{
		if Gamerule_1.IsGemActive //wait until I am stationary
		{
			instance_create(x,y,obj_gemoutlines) //create a bomb outline effect
			bombappear = true //no more first time appear checking
			make_infobox(Gamerule_1.FirstTime_Bomb,2) //make first time info tutorial if its the first time
			audio_play_sound(bomb5,0,0) //play the bomb sound effect the first time the bomb appears
		}
	}
	else //if countdown <= 7 //if my countdown value is less than 8
	{
		if playcountdown //if I haven't played the bomb sound effect
		{
			if (countdown >= 0 && countdown <= 5) //check if im less than 6 to play the sound effect
			{
				if Gamerule_1.IsGemActive2
				{
					if amBomb instance_create(x,y,obj_gemoutlines) //create a bomb outline effect
					else if (amLocked == 4) instance_create(x,y,obj_skull_glow) //or a skull outline effect
					playcountdown = false //dont replay the sound effect until a swap happens
					var snd = asset_get_index("bomb"+string(countdown)) //find the correct pitch. bomb0? bomb1?
					audio_play_sound(snd,0,0) //play the sound
				}
			}
		}
			if (countdown <= 7) //if my countdown value is less than 8
			{
				xmover = irandom_range(countdown-8,8-countdown) //shakiness value (used in the draw event)
				ymover = irandom_range(countdown-8,8-countdown)
			}
			else
			{
				xmover = 0
				ymover = 0
			}
		if countdown = 0
		{
			if (amBomb || amLocked = 2) Gamerule_1.bombis0 = true //if am Bomb/Doom
			else //if am Skull
			{
				Gamerule_1.skullis0 = true;
				was_skull_0 = true;
				if Gamerule_1.IsGemActive2 && !Gamerule_1.challengewon && !Gamerule_1.levelbarfull && !Gamerule_1.levelcompleted//if everything is stationary
				{
					if !instance_exists(obj_bombexplosion) //if we aren't game over'ing
					{
						if _i < 7 //if im not in the last board row
						{
							with(Gamerule_1.gem_board1[_i+1,_j]) //create particles below me
							{
								part_particles_create(global.sys_above_gem, x, y, global.part_BombSmoke, 3);
								part_particles_create(global.sys_above_gem, x, y, global.part_BombSmoke2, 3);
							}
							instance_destroy(Gamerule_1.gem_board1[_i+1,_j]) //and kill the gem below me
							part_particles_create(global.sys_above_gem,x,y+32,global.part_skullgembreak,15)
							audio_play_sound(snd_skull_gem_break,0,0)
						}
						else //if I am in the last row
						{
							Gamerule_1.controlallowed = false //disable user control
							Gamerule_1.spawnallowed = false //disable spawning gems
							Gamerule_1.autosave_allowed = false //disable autosaving
							countdown = 20 //set countdown to 20 so this event won't loop for being at 0
							file_delete("autosave_"+string(room_get_name(room))) //goodbye save
							audio_play_sound(snd_bombgameover,0,0) //explosion sound
							audio_play_sound(vo_gameover,0,0) //gameover announce
							var ded = instance_create(x,y,obj_bombexplosion) //create a bomb explosion object
							ded.image_index = 0
							ded.sprite_index = spr_skull
							amInvisible = true //make me (the gem) invisible
						}
					}
				}
			}
		}
		else if was_skull_0 Gamerule_1.skullis0 = false; //if previously was skull on 0, now bring back control to the player
	}
}
else //if im not doom, skull or bomb
{
	if shake //if i have to shake for being killed by a fruit
	{
		xmover = irandom_range(-2,2)
		ymover = irandom_range(-2,2)
	}
	else //else set the shake with an other shake variable that im using for near cascades
	{
		xmover = xmover2
		ymover = ymover2
	}
}
#endregion

#region Lighting
if MyGamerule.lightOn //if lightning is happening
{
	if global.OPT_lightallowed
	{
		if collision_rectangle(x-35,y-35,x+35,y+35,MyLightObj,false,true) //check if the lightning is near me
		{
			bloom = true //and make me glow
		}
		else
		{
			bloom = false
		}
	}
}
else bloom = false
#endregion

if !lvlcomplete //if level isn't complete
{
#region Gem movement and collision
var shouldmove = true //by default, we are able to move
if (ammoving) || (dont_fall_yet) || (!Gamerule_1.should_move) shouldmove = false //unless im being swapped or i had a recent match below me or i mustn't move because of gamrule 1 restrictions
else if (amInvisible) shouldmove = false //or I am invisible (used for gems below ice)
else if (amLocked = 3) shouldmove = false //or i am ice locked

if shouldmove //if i should be able to move
{

//if (_i != 7) || acc != 0 //no need to check for collisions at the very bottom
	{		
			acc += accspeed //accelerate
			if (y + acc > Board_1.y + 512-64) //if that acceleration will bring us under the board
			{
				acc = 0 //stop
				y = Board_1.y + 512-64 //and set us to the bottom row
			}
			else //if that acceleration is moving us inside the board
			{
				if _i < 0 // dont check collision if we are ABOVE the board
				{
					var toucher = noone
				}
				else //inside the board
				{
					var toucher = collision_point(x,y+acc+(sprite_height/2),Gem_1,false,true) //check below me
				}
				
				if (toucher != noone) //if we are going to touch a gem
				{
					if toucher.acc = 0 //check if that gem isn't moving (which means we are going to crash on it)
					{
						acc = 0 //stop me
						y = toucher.y - toucher.sprite_yoffset - (sprite_height/2)//...find the other y, and depending on the y origin, move me exactly above it
					}
					else if acc >= toucher.acc //if the other gem is moving too with a less speed than ours (we are crashing on it)
					{
						acc = toucher.acc - accspeed //take its speed and set it to me
						y = toucher.y - toucher.sprite_yoffset - (sprite_height/2)//...find the other y, and depending on the y origin, move me exactly above it
					}
				}
				else //if no one is below us
				{
					if !Gamerule_1.flameon || acc < 0 //if a flame explosion is not happening or somehow we have negative velocity
					{
						y+=acc //move me, finally
					}
					else acc = 0 //if flame explosion is happening, dont move me further
				}	
			}
			
	}
	//else {acc = 0; y = MyBoard.y + 64*_i}
} else acc = 0




#endregion
}
else //else, parent me with the Board (level transition effect)
{
	x = Board_1.x + X
}

#region _i and _j
previous_i = _i
_i = (y-MyBoard.y+63) div 64 //find my grid index. first row = 0, second = 1 etc
_j = (x-MyBoard.x) div 64 //find my grid index. first collumn = 0, second = 1 etc
if amLocked = 4 //if im skull
{
	if _i > previous_i //if i changed my grid index
	{
		countdown += obj_skull_control.SkullCounter //add to the counter
	}
	else if (_i < previous_i) countdown -= obj_skull_control.SkullCounter //if somehow i got negative velocity, subtract?
}
#endregion

#region Gempower particles
var luck,sys; //randomizer stuff for particles below
if visible //if I am visible
{
	if gempower > 0 //if I have a power
	{
		var XX = x+SWAP_X
		var YY = y+SWAP_Y
		if global.OPT_lightallowed {
			if (gempower != FRUIT) glow_nearby_gems(_i,_j)
		}
		if gempower = FLAME //flame
		{
			part_particles_create(global.sys_below_gem,XX,YY,global.partFire,1)
		}
		else if gempower = LIGHTNING //lighting
		{
			luck = irandom(10)
			if luck < 2 sys = global.sys_above_gem
			else sys = global.sys_below_gem
			part_emitter_region(sys,global.emit_newstar,XX-32,XX+32,YY-32,YY+32,ps_shape_ellipse,ps_distr_gaussian)
			part_emitter_burst(sys,global.emit_newstar,global.part_star_bolt,2)
		}
		else if gempower = NOVA //nova
		{
			luck = irandom(10)
			if luck < 2 sys = global.sys_above_gem
			else sys = global.sys_below_gem
			part_emitter_region(sys,global.emit_newstar,XX-32,XX+32,YY-32,YY+32,ps_shape_ellipse,ps_distr_gaussian)
			part_emitter_burst(sys,global.emit_newstar,global.part_star_bolt,2)
			part_particles_create(global.sys_below_gem,XX,YY,global.partNovaFire,1)
		}
		else if gempower = SEPTA //septa
		{
			part_particles_create(global.sys_below_gem,XX,YY,global.partFire,1)
			part_particles_create(global.sys_below_gem,XX,YY,global.partCinder,1)
			luck = irandom(10)
			if luck < 2 sys = global.sys_above_gem
			else sys = global.sys_below_gem
			part_emitter_region(sys,global.emit_newstar,XX-32,XX+32,YY-32,YY+32,ps_shape_ellipse,ps_distr_gaussian)
			part_emitter_burst(sys,global.emit_newstar,global.part_star_bolt,2)
			part_particles_create(choose(global.sys_below_gem,global.sys_above_gem),XX,YY,global.partSeptafractal,1)
		}
		else if gempower = OCTA //octa
		{
			part_particles_create(global.sys_below_gem,XX,YY,global.partFire,1)
			part_particles_create(global.sys_below_gem,XX,YY,global.partCinder,1)
			luck = irandom(10)
			if luck < 2 sys = global.sys_above_gem
			else sys = global.sys_below_gem
			part_emitter_region(sys,global.emit_newstar,XX-32,XX+32,YY-32,YY+32,ps_shape_ellipse,ps_distr_gaussian)
			part_emitter_burst(sys,global.emit_newstar,global.part_star_bolt,2)
			part_particles_create(choose(global.sys_below_gem,global.sys_above_gem),XX,YY,global.partOctafractal,1)
		}
		else if gempower = FRUIT //fruit
		{
			if (sprite_index != spr_fruits) sprite_index = spr_fruits
			if amFruitExploding
			{
				xmover = irandom_range(-2,2)
				ymover = irandom_range(-2,2)
			}
			else
			{
				part_particles_create(global.sys_above_gem,XX,YY,global.part_fruit_sparkles,1)
			}
		}
	}
	else if amHype //if im hypercube
	{
		var XX = x+SWAP_X
		var YY = y+SWAP_Y
		part_particles_create(global.sys_below_gem,irandom_range(XX-24,XX+24),irandom_range(YY-24,YY+24),global.part_hypercube,1)
		if alarm[3] = -1 alarm[3] = 2
	}
	else if amLocked = 2 //if im Doom
	{
		var XX = x+SWAP_X
		var YY = y+SWAP_Y
		part_type_direction(global.d_g2,100,120,0,1)
	    part_particles_create(global.sys_below_gem,XX-16,YY-32,global.d_g2,1)
	    part_type_direction(global.d_g2,100-45,120-45,0,1)
	    part_particles_create(global.sys_below_gem,XX+16,YY-32,global.d_g2,1) 
	    part_type_direction(global.d_g1,100,120,0,1)   
	    part_particles_create(global.sys_below_gem,XX-16,YY-32,global.d_g1,2)
	    part_type_direction(global.d_g1,100-45,120-45,0,1)
	    part_particles_create(global.sys_below_gem,XX+16,YY-32,global.d_g1,2)
	}
}

#endregion

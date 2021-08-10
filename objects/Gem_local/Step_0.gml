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

#region accspeed and replay slowmo modifier
	var accspeed = 0.6; //default speed acceleration
	modifier = 1; //speed slow-mo modifier. 1 = normal, 2 = half the speed
#endregion

#region xmover/ymover and Bomb

if amBomb || amLocked =2 || amLocked = 4 //if I am bomb or doom or skull
{
	if !bombappear && amBomb //if its the first time I appear and I am a bomb
	{
		if MyGamerule.IsGemActive //wait until I am stationary
		{
			instance_create(x,y,obj_gemoutlines) //create a bomb outline effect
			bombappear = true //no more first time appear checking
			audio_play_sound(bomb5,0,0) //play the bomb sound effect the first time the bomb appears
		}
	}
	else if countdown <= 7 //if my countdown value is less than 8
	{
		if playcountdown //if I haven't played the bomb sound effect
		{
			if (countdown >= 0 && countdown <= 5) //check if im less than 6 to play the sound effect
			{
				if MyGamerule.IsGemActive2
				{
					if amBomb instance_create(x,y,obj_gemoutlines) //create a bomb outline effect
					else if (amLocked == 4) instance_create(x,y,obj_skull_glow) //or a skull outline effect
					playcountdown = false //dont replay the sound effect until a swap happens
					var snd = asset_get_index("bomb"+string(countdown)) //find the correct pitch. bomb0? bomb1?
					audio_play_sound(snd,0,0) //play the sound
				}
			}
		}		
		xmover = irandom_range(countdown-8,8-countdown) //shakiness value (used in the draw event)
		ymover = irandom_range(countdown-8,8-countdown)
		if countdown = 0
		{
			if (amBomb || amLocked = 2) MyGamerule.bombis0 = true //if am Bomb/Doom
		}
	}
	else //if my counter is more than 7, dont shake
	{
		xmover = 0
		ymover = 0
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
if (ammoving) || (dont_fall_yet) || (!MyGamerule.should_move) shouldmove = false //unless im being swapped or i had a recent match below me or i mustn't move because of gamrule 1 restrictions
else if (amInvisible) shouldmove = false //or I am invisible (used for gems below ice)
else if (amLocked = 3) shouldmove = false //or i am ice locked

if shouldmove //if i should be able to move
{

//if (_i != 7) || acc != 0 //no need to check for collisions at the very bottom
	{		
			acc += accspeed //accelerate
			if (y + acc > MyBoard.y + 512-64) //if that acceleration will bring us under the board
			{
				acc = 0 //stop
				y = MyBoard.y + 512-64 //and set us to the bottom row
			}
			else //if that acceleration is moving us inside the board
			{
				if _i < 0 // dont check collision if we are ABOVE the board
				{
					var toucher = noone
				}
				else //inside the board
				{
					var toucher = collision_point(x,y+acc+(sprite_height/2),MyGem,false,true) //check below me
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
					if !MyGamerule.flameon || acc < 0 //if a flame explosion is not happening or somehow we have negative velocity
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
	x = MyBoard.x + X
}

#region _i and _j
previous_i = _i
_i = (y-MyBoard.y+63) div 64 //find my grid index. first row = 0, second = 1 etc
_j = (x-MyBoard.x) div 64 //find my grid index. first collumn = 0, second = 1 etc
#endregion

#region Gempower particles
var luck,sys; //randomizer stuff for particles below
if visible //if I am visible
{
	if gempower > 0 //if I have a power
	{
		var XX = x+SWAP_X
		var YY = y+SWAP_Y
		if gempower = 1 //flame
		{
			part_particles_create(global.sys_below_gem,XX,YY,global.partFire,1)
		}
		else if gempower = 2 //lighting
		{
			luck = irandom(10)
			if luck < 2 sys = global.sys_above_gem
			else sys = global.sys_below_gem
			part_emitter_region(sys,global.emit_newstar,XX-32,XX+32,YY-32,YY+32,ps_shape_ellipse,ps_distr_gaussian)
			part_emitter_burst(sys,global.emit_newstar,global.part_star_bolt,2)
		}
		else if gempower = 3 //nova
		{
			luck = irandom(10)
			if luck < 2 sys = global.sys_above_gem
			else sys = global.sys_below_gem
			part_emitter_region(sys,global.emit_newstar,XX-32,XX+32,YY-32,YY+32,ps_shape_ellipse,ps_distr_gaussian)
			part_emitter_burst(sys,global.emit_newstar,global.part_star_bolt,2)
			part_particles_create(global.sys_below_gem,XX,YY,global.partNovaFire,1)
		}
		else if gempower = 4 //septa
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
		else if gempower = 5 //octa
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
		else if gempower = 6 //fruit
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

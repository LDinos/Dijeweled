function EV_gem_CREATE(){
/// @description Gem object
// You can write your code in this editor
gemglow_alpha = random(1)
nearby_glown_left = false //am I glown because of a nearby power gem?
nearby_glown_right = false //am I glown because of a nearby power gem?
nearby_glown_up = false //am I glown because of a nearby power gem?
nearby_glown_down = false //am I glown because of a nearby power gem?

was_skull_0 = false;

mypowerup = -1
myid = -4

isturnback = false
dont_fall_yet = false //while twist rotating, we dont want the gems above to fall down, thus we made this variable
SWAP_X = 0 //swapping x firt point
SWAP_X_END = 0 //swapping x last point (the other gem's.x)
SWAP_Y_END = 0 //swapping y firt point
SWAP_Y = 0 //swapping x last point (the other gem's.y)
percent = 0; //used in lerp in swapping
shake = false //for when fruit is triggering me make me shake
allowgemdestroytext = true //if its lasthurrah, dont show gemstext
lvlcomplete = false //if lvlcomplete, follow the Board when it goes away
shadow_index = spr_shadows
anim_happening = false //for when spinning animation

cascade_diss = false //normal gems just dissappear, but if you have a combo, a slightly different dissappearing animation happens
make_inv_dis = false //make image alpha of dissappearing gem 0 when dead?
create_col = true //create collider on death? If I make a flame gem 4 gem match, it should not create a collider
amInvisible = false //used for icegems below

modifier = 1 //slow mo speed modifier (1 = normal)

#region Directional light
light_right = false
light_up = false
light_down = false
light_left = false //check begin step
#endregion

dragXX = 0
dragYY = 0 //used in matcherstep event for when 4+ matches happen, do a gem drag animation

geodenum = irandom_range(1,MyGamerule.geodemax) //number of geodes if I am coal
for(i=0;i<geodenum;i++) geodenum_points[i] = choose(50,100,150,200,250,300) //geode points if i am coal

#region Bomb stuff
playcountdown = false //playing the bomb countdown audio when gems are stationiary and countdown <= 5
bombappear = false //have i made the bomb appear noise?
countdown = 20 //bomb or doom countdown
#endregion

#region BLOOM SHADER
bloomIntensity = shader_get_uniform(shdr_bloom, "intensity");
bloomblurSize = shader_get_uniform(shdr_bloom, "blurSize");
bloom = false
varbloom = 0
#endregion

#region BRIGHT SHADER
uni_time = shader_get_uniform(shd_bright_contrast,"time");
var_time_var = 0;

uni_mouse_pos = shader_get_uniform(shd_bright_contrast,"mouse_pos");
var_mouse_pos_x = mouse_x - camera_get_view_x(0);
var_mouse_pos_y = mouse_y - camera_get_view_y(0);

uni_resolution = shader_get_uniform(shd_bright_contrast,"resolution");
var_resolution_x = camera_get_view_width(0);
var_resolution_y = camera_get_view_height(0);

uni_brightness_amount = shader_get_uniform(shd_bright_contrast,"brightness_amount");
var_brightness_amount = .4;

uni_contrast_amount = shader_get_uniform(shd_bright_contrast,"contrast_amount");
var_contrast_amount = 0;
#endregion

#region _i, _j
_i = floor((y-MyBoard.y+63)/64) //returns 0-7 grid index (row)
_j = (x-MyBoard.x+63) div 64 //returns 0-7 grid index (collumn)
previous_i = _i
previous_j = _j
#endregion


#region Am's
amCompanion = false
amBomb = false //am I a bomb?
amFruitExploding = false //am i fruit shaking (going to explode?)
amBeingLocked = 0 //am i having a lock sprite indicator on top of me? 1 = normal lock, 2 = doom, 3 = ice, 4 = skull
amLocked = 0 //0 = no, 1 = locked, 2 = doomlocked, 3 = ice locked, 4 = skull locked
amexplode = false//am i on blazing speed?
matchnear = false //used in player1 somehow?
ammoving = false //if moving by user drag animation
amMulti = false //am I a multiplier gem?
amHype = false //am I a hypercube?
amTimeGem = false //am I a time gem?
amPowered = false //Did I just get powered? Used to not be destroyed immediatley on power creation
amLit = false //is a lightning strike onto me?
amSpecial = 0 //0 = false, 1 = special one, 2 = special two, 3 = special three... Used to check best move for bot
TimeGem = 0 //either +5 or +10 if its timegem
moving = false //moving in match animation?
#endregion

#region Hype stuff
hyper_anim = 0 //hypercube image_index animation (used in alarm 3)
gem_to_hype = noone //gem to destroy first on hypercube match
skin_to_hype = 0 //skin to destroy on hypercube match, 8 destroys all
#endregion


#region Shaky stuff
dontshake = false //used for xymover when destroyed. this will be true if it gets destroyed by explosion
xmover = 0 //offset for shaking. one is for bomb, other for fruit
ymover = 0
xmover2 = 0
ymover2 = 0
#endregion

matchme = -1 //stuff for matchstep event
spinning = false //am I selected and spinning?

#region Skin
skinnum = irandom_range(0,MyGamerule.num_skin) //my skin
image_index = skinnum
particle_flame_asset = asset_get_index("coord_" + string(image_index))
particle_flame_points = path_get_number(particle_flame_asset)
image_speed = 0
image_xscale = .5 //Gem sprites are 256x256, so we need to scale them to 64
image_yscale = .5
#endregion

#region my color
	switch skinnum
	{
		case 0: mycolor = c_red break;
		case 1: mycolor = c_white break;
		case 2: mycolor = c_green break;
		case 3: mycolor = c_yellow break;
		case 4: mycolor = c_purple break;
		case 5: mycolor = c_orange break;
		case 6: mycolor = c_blue break;
		default: mycolor = c_red break;
	}
#endregion

acc = 0 //speed
gempower = 0
}

function EV_gem_STEP(){
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
		if MyGamerule.IsGemActive //wait until I am stationary
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
			if global.OPT_lightallowed
			{
				var shouldhappen = irandom(1)
				if shouldhappen != 1
				{
					var rand = irandom(particle_flame_points-1)
					var xx = path_get_point_x(particle_flame_asset,rand)
					var yy = path_get_point_y(particle_flame_asset,rand)
					var sys = global.sys_below_gem
					var luck = irandom(9)
					if (luck == 0) sys = global.sys_above_gem
					part_particles_create(sys,x+xx,y+yy,global.part_newflame_ember,1)
					part_particles_create(sys,x+xx,y+yy,global.part_newflame,1)
				}
			}
			else
			{
				part_particles_create(global.sys_below_gem,XX,YY,global.partFire,1)
			}
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

}
	
function EV_gem_ALARM5(){
	/// @description MATCH ANIM
var modi = modifier
if instance_exists(MyPlayer.gemtomove1) && instance_exists(MyPlayer.gemtomove2)
{
	//power(percent,2)
	SWAP_X = ease_inout_sine(percent,0,SWAP_X_END,1)//round(lerp(0,SWAP_X_END,power(percent,2))) //- x
	SWAP_Y = ease_inout_sine(percent,0,SWAP_Y_END,1)//round(lerp(0,SWAP_Y_END,power(percent,2))) //- y

	percent += 0.1/modi

	if percent <= 1 alarm[5] = 1
	else
	{
		percent = 0
		SWAP_X = round(lerp(0,SWAP_X_END,1)) //- x
		SWAP_Y = round(lerp(0,SWAP_Y_END,1)) //- y
		x += SWAP_X		
		y += SWAP_Y
		SWAP_X = 0
		SWAP_Y = 0
		SWAP_X_END = 0
		SWAP_Y_END = 0
		if (!isturnback) {with(MyPlayer) alarm[2] = 5}
		else {alarm[2] = 5;MyGamerule.moving = false; with(MyPlayer) alarm[7] = 3}
	}
}
else 
{
	instance_destroy(MyPlayer.gemtomove1)
	instance_destroy(MyPlayer.gemtomove2)
	with(MyPlayer) alarm[2] = 5
}
}
#region My
<<<<<<< HEAD
MyGem = Gem_1 //Instance variables so that copy pasting code through gems will be easier
MyGamerule = Gamerule_1
MyBoard = Board_1
MyLightObj = lightningObj1
MyLightKiller = lightningkiller
MyDiagonalLight = obj_diagonal_lighting
MyPlayer = player1
if (room == rm_blitz_matchreplay) MyPlayer = player1_matchreplay
//else if room = rm_twist MyPlayer = obj_twist_spinner
MyDiss = gem_dissappear
#endregion

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

#region Cross stuff
cross_anim = 0
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
skinnum = irandom_range(0,Gamerule_1.num_skin) //my skin
image_index = skinnum
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
=======
	MyGem = Gem_1 //Instance variables so that copy pasting code through gems will be easier
	MyGamerule = Gamerule_1
	MyBoard = Board_1
	MyLightObj = lightningObj1
	MyLightKiller = lightningkiller
	MyPlayer = player1
	if (room == rm_blitz_matchreplay) MyPlayer = player1_matchreplay
	//else if room = rm_twist MyPlayer = obj_twist_spinner
	MyDiss = gem_dissappear
#endregion

EV_gem_CREATE()
>>>>>>> 1.9

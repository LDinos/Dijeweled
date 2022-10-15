room_speed = 60
instance_create(0,0,obj_local_getready)
global.user2 = global.user + "(2)"
//draw_texture_flush()
with(obj_background_shadered) shd = irandom(num_shaders)

if !global.bot1
{
	if global.gp[1] == KEYBOARD
	{
		Gamerule_1.keyboard_allowed = false
		Gamerule_1.gamepad_allowed = true
		Gamerule_local.gamepad_allowed = false
		Gamerule_local.keyboard_allowed = true
	}
	else
	{
		Gamerule_1.keyboard_allowed = true
		if (global.gp[1] == global.gp[0]) Gamerule_1.gamepad_allowed = false
		Gamerule_local.gamepad_allowed = true
		Gamerule_local.keyboard_allowed = false
	}
}
else
{
	Gamerule_1.gamepad_allowed = true
	Gamerule_1.keyboard_allowed = true
}
if global.SET_twist
{
	instance_create(x,y,obj_twist_spinner)
	instance_destroy(player1)
	instance_create(x,y,obj_twist_spinner_local)
	instance_destroy(player_local)
}

var dic = "Online: Battle"
with(Gamerule_local)
{
	ultranovas_allowed = global.SET_ultranovas
	AHM_allowed = true
	end_on_nomoves = false
	replay_allowed = false
	blazingallowed = (global.SET_blazing && global.SET_gamemode == 0) ? true : false
	levelcompleteallowed = false
	autosave_allowed = false
	controlallowed = false
	spawnallowed = false
	multiswap_allowed = global.SET_multiswap
	hypeallowed = global.SET_hyper
	illegals_allowed = global.SET_matchless
	num_skin = global.SET_skin - 1

	if (global.SET_gamemode == 1)
	{
		controlallowed = false
		blazingallowed = false
		points_allowed = false
		force_moves_allowed = false
		compliments_allowed = false
	}
	else if (global.SET_gamemode == 2)
	{
		blazingallowed = false
		force_moves_allowed = false
	}
}
with(Gamerule_1)
{
	hybrid_allowed = false;
	points_text_allowed = false
	ultranovas_allowed = global.SET_ultranovas
	AHM_allowed = true
	end_on_nomoves = false
	replay_allowed = false
	blazingallowed = (global.SET_blazing && global.SET_gamemode == 0) ? true : false
	levelcompleteallowed = false
	autosave_allowed = false
	controlallowed = false
	spawnallowed = true
	multiswap_allowed = global.SET_multiswap
	hypeallowed = global.SET_hyper
	illegals_allowed = global.SET_matchless
	num_skin = global.SET_skin - 1
	
	if (global.SET_gamemode == 0)
	{
		dic = "Online: Time Attack"
		if global.SET_gamemode2 = 0 global.timer = 300
		else if global.SET_gamemode2 = 1 global.timer = 180
		else global.timer = 60
		instance_create(640,1104,obj_glassbar)
		instance_create(640,552,obj_rotator)
		instance_create(576,1104,obj_pipes)
		instance_create(64,1104,obj_scorer1)
		instance_create(1216,1104,obj_scorer2)
	}
	else if (global.SET_gamemode == 1)
	{
		blazingallowed = false
		points_allowed = false
		instance_create(0,0,obj_music)
		force_moves_allowed = false
		compliments_allowed = false
		dic = "Online: Avalanche";
		instance_create(320,1168,obj_avalanchedeposit_local)
	}
	else
	{
		instance_create(room_width/2,room_height-32,obj_tugowar)
		instance_create(0,0,obj_powerupcontrol)
		blazingallowed = false
		force_moves_allowed = false
	}
}


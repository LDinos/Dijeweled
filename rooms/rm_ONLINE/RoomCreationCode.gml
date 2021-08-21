room_speed = 60
draw_texture_flush()
with(obj_background_shadered) shd = irandom(num_shaders)
if !global.IAMHOST
{
	var xx = Board_1.x
	var yy = Board_1.y
	Board_1.x = Board_2.x
	Board_1.y = Board_2.y
	Board_2.x = xx
	Board_2.y = yy
	var xx = player1.x
	var yy = player1.y
	player1.x = player2.x
	player1.y = player2.y
	player2.x = xx
	player2.y = yy
	/*
	var xx = obj_pbox1.x
	var yy = obj_pbox1.y
	obj_pbox1.x = obj_pbox2.x
	obj_pbox1.y = obj_pbox2.y
	obj_pbox2.x = xx
	obj_pbox2.y = yy*/
}
if global.SET_twist
{
	instance_create(x,y,obj_twist_spinner)
	instance_destroy(player1)
}

var dic = "Online: Battle"
with(Gamerule_1)
{
	ultranovas_allowed = global.SET_ultranovas
	AHM_allowed = true
	end_on_nomoves = false
	replay_allowed = false
	blazingallowed = true
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
		instance_create(320,1168,obj_avalanchedeposit)
	}
	else
	{
		instance_create(room_width/2,room_height-32,obj_tugowar)
		instance_create(0,0,obj_powerupcontrol)
		blazingallowed = false
		force_moves_allowed = false
	}
}

discord_update_presence(dic,"VS " + global.user2,"ico_512","")
room_speed = 60
//draw_texture_flush()
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
	obj_textspeed1.x = Board_1.x + 7*64
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
		instance_create(320,1168,obj_avalanchedeposit)
	}
	else //UNUSED
	{
		instance_create(room_width/2,room_height-32,obj_tugowar)
		instance_create(0,0,obj_powerupcontrol)
		blazingallowed = false
		force_moves_allowed = false
	}
}

if (global.spectator) {
	var b = instance_create_depth(96, 608, Board_1.depth, SPEC_board)
	b.player_id = 0
	b.player_name = global.user1
	b = instance_create_depth(736, 608, Board_1.depth, SPEC_board)
	b.player_id = 1
	b.player_name= global.user2
	instance_destroy(Board_1)
	instance_destroy(Board_2)
	instance_destroy(obj_pbox1)
	instance_destroy(obj_pbox2)
	instance_destroy(player1)
	instance_destroy(obj_twist_spinner)
	if (global.SET_gamemode == 1) {
		instance_create(320,1168,obj_avalanchedeposit_spectator)
		instance_destroy(obj_avalanchedeposit)
	}	
}

discord_update_presence(dic,"VS " + global.user2,"ico_512","")
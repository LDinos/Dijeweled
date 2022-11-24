room_speed = 60
//draw_texture_flush()
with(obj_background_shadered) shd = irandom(num_shaders)
instance_create(0,0,obj_online_replay)

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
		instance_create(room_width/2, 512 + (room_height-512)/2, obj_skip_turn)
		force_moves_allowed = false
		compliments_allowed = false
		dic = "Online: Avalanche";
		instance_create(320,1168,obj_avalanchedeposit_spectator)
	}

}


if (global.SET_gamemode == 1) {
	instance_create(320,1168,obj_avalanchedeposit_spectator)
	instance_destroy(obj_avalanchedeposit)
}	

DISCORD np_setpresence_timestamps(date_current_datetime(), 0, false)
DISCORD np_setpresence(global.user1 + " VS " + global.user2, "Watching Replay", "ico_512", "")
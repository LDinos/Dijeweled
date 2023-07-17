room_speed = 60
obj_radio.music = mus_blitz5min
obj_radio.loop = true

draw_texture_flush()
//RADIO\\
discord_update_presence(global.DIS_name,"","ico_512","")
with(obj_levelbar)
{
	global.timer = 300
	time_full = global.timer
	time_now = time_full
	alarm[2] = 80
}
with(Gamerule_1)
{
	end_on_nomoves = false
	AHM_allowed = true
	force_moves_allowed = false
	illegals_allowed = false
	geodemax = 1
	compliments_allowed = false
	autosave_allowed = false
	spawnallowed = true
	time_allowed = true
	geode_xplier = 20
	points_type = 2
	isQuest = false
	multiswap_allowed = true
	blazingallowed = false
	wheel_spinner_allowed = false
	replay_allowed = false
}
instance_create(x,y,spawner1)
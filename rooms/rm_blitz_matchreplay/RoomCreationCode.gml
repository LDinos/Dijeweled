room_speed = 60
Gamerule_1.time_allowed = true
Gamerule_1.autosave_allowed = false
Gamerule_1.replay_allowed = false
Gamerule_1.multiswap_allowed = true
Gamerule_1.blazingallowed = true
Gamerule_1.isQuest = false
DISCORD np_setpresence(global.version, "Watching Blitz Replay", "ico_512", "")
//Gamerule_1.geode_xplier = 5
with(obj_levelbar)
{
	time_full = global.timer
	time_now = time_full
	alarm[2] = 80
}
//draw_texture_flush()
//RADIO\\
//
if global.timer <= 60 
{
obj_radio.music = mus_blitz1min
obj_radio.loop = true
}
else if global.timer <= 180
{
obj_radio.music = mus_blitz3min
obj_radio.loop = true	
}
else if global.timer <= 60*4
{
obj_radio.music = mus_blitz4min
obj_radio.loop = true
}
else
{
obj_radio.music = mus_blitz5min
obj_radio.loop = true	
}

var json = json_read_parse(global.replay_string)
//ini_open(global.replay_string)
var istwist = json.is_twist// ini_read_real("replay","is_twist",false)
//ini_close()

if (istwist) {
	instance_create(512, 650, obj_twist_spinner)
}
else {
	instance_create(768, 768, player1_matchreplay)
}
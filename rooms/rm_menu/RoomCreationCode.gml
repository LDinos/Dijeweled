#macro CHALLENGES_VER 10 //change me if you make a change in create_challenge_ini
draw_set_font(font0)
randomise()
effect_clear()
instance_destroy(obj_server)
instance_destroy(obj_client)
global.canbepressed = false
global.online = false
global.replay_match_allowed = false
global.replay_match_isplaying = false
global.bot1 = false
global.botdifficulty1 = 0
if !instance_exists(OBJ_GRAPHICS) instance_create(x,y,OBJ_GRAPHICS)

if !file_exists("challenges.ini")
{
	ini_open("challenges.ini")
		create_challenge_ini()
	ini_close()
}
else
{
	ini_open("challenges.ini")
		if ini_read_real("ver","value",0) != CHALLENGES_VER create_challenge_ini()
	ini_close()
}

discord_update_presence("In Main Menu",global.version,"ico_512","")
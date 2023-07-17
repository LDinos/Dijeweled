room_speed = 60
//draw_texture_flush()
DISCORD np_setpresence("Level " + string(Gamerule_1.level), global.DIS_name, "ico_512", "")
with(Gamerule_1)
{
	specials_allowed = false
	points_xpliered_auto = true
	AHM_allowed = false
	illegals_allowed = false
	//hypeallowed = true
	isQuest = false
}
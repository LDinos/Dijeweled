room_speed = 60
DISCORD np_setpresence("Level " + string(Gamerule_1.level), global.DIS_name, "ico_512", "")
//draw_texture_flush()
//RADIO\\

with(Gamerule_1)
{
	multiswap_allowed = true
	replay_allowed = false
	isQuest = false
	wheel_spinner_allowed = true
}
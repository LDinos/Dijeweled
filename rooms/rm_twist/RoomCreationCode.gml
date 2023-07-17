room_speed = 60
discord_update_presence(global.DIS_name,"Level " + string(Gamerule_1.level),"ico_512","")
draw_texture_flush()
//RADIO\\

with(Gamerule_1)
{
	multiswap_allowed = true
	replay_allowed = false
	isQuest = false
	wheel_spinner_allowed = true
}
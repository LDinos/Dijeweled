room_speed = 60

draw_texture_flush()
//RADIO\\
discord_update_presence(global.DIS_name,"Level " + string(Gamerule_1.level),"ico_512","")
with(Gamerule_1)
{
	isQuest = false
	multiswap_allowed = true
	blazingallowed = true
	wheel_spinner_allowed = true
	replay_allowed = false
}
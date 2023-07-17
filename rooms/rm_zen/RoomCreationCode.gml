room_speed = 60
draw_texture_flush()
discord_update_presence(global.DIS_name,"Level " + string(Gamerule_1.level),"ico_512","")
with(obj_coal_control) CoalSpawnLevelMin = 1
with(Gamerule_1)
{
	//points_xpliered_auto = true
	amzen = true
	AHM_allowed = true
	illegals_allowed = false
	hypeallowed = true
	replay_allowed = true
	isQuest = false
	multiswap_allowed = true
}
audio_play_sound(mus_zen,0,true)
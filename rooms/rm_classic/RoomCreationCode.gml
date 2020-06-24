room_speed = 60
draw_texture_flush()
with(obj_coal_control) CoalSpawnLevelMin = 15
discord_update_presence(global.DIS_name,"Level " + string(Gamerule_1.level),"ico_512","")
with(Gamerule_1)
{
	points_type = 2
	points_xpliered_auto = true
	AHM_allowed = false
	illegals_allowed = false
	hypeallowed = true
	isQuest = false
}
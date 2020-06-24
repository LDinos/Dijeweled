/// @description Insert description here
global.STATS_points = Gamerule_1.points
global.STATS_file = "stats_buyo.ini"
global.STATS_level = Gamerule_1.level
if !file_exists(global.STATS_file)
{
	stats_create_buyo()
}
fade_to_room(rm_stats_normal)
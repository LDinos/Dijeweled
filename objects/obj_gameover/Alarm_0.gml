/// @description Insert description here
// You can write your code in this editor
if (!Gamerule_1.isQuest)
{
	switch room
	{
		case rm_classic:
			room_to_go = rm_stats_normal
			if !file_exists("stats_classic.ini") stats_create_classic()
			global.STATS_file = "stats_classic.ini"
			global.STATS_points = Gamerule_1.points
			global.STATS_level = Gamerule_1.level
			break;
		case rm_compact:
			room_to_go = rm_stats_normal
			if !file_exists("stats_compact.ini") stats_create_compact()
			global.STATS_file = "stats_compact.ini"
			global.STATS_points = Gamerule_1.points
			global.STATS_level = Gamerule_1.level
			break;
		default:
			room_to_go = rm_menu
			break;
	}	
}
else
{
	room_to_go = rm_menu_challenges
}

fade_to_room(room_to_go)
/// @function script()
/// @description default
/// @param {type} param first parameter
function scr_gameover(has_level){
		switch room
		{
			case rm_timeattack:
				if !file_exists("Stats/stats_arcade.ini") stats_create_arcade()
				global.STATS_file = "stats_arcade.ini"
				global.STATS_gamemode = "arcade"
				global.STATS_points = Gamerule_1.points
				global.STATS_level = Gamerule_1.level
				break;
			case rm_twist:
				if !file_exists("Stats/stats_twist.ini") stats_create_twist()
				global.STATS_file = "stats_twist.ini"
				global.STATS_gamemode = "twist"
				global.STATS_points = Gamerule_1.points
				global.STATS_level = Gamerule_1.level
				break;
			case rm_swift:
				if !file_exists("Stats/stats_swift.ini") stats_create_swift()
				global.STATS_file = "stats_swift.ini"
				global.STATS_gamemode = "swift"
				global.STATS_points = Gamerule_1.points
				global.STATS_level = Gamerule_1.level
			case rm_survivor:
				if !file_exists("Stats/stats_survivor.ini") stats_create_survivor()
				global.STATS_file = "stats_survivor.ini"
				global.STATS_gamemode = "survivor"
				global.STATS_points = Gamerule_1.Moves_Made
				break;
			case rm_countdown:
				global.STATS_points = Gamerule_1.points
				global.STATS_file = "stats_countdown.ini"
				global.STATS_gamemode = "countdown"
				if !file_exists("Stats/"+global.STATS_file) stats_create_countdown()
				break;
			case rm_blitz:
				if !file_exists("Stats/stats_blitz"+string(global.timer)+".ini") stats_create_blitz()
				global.STATS_file = "stats_blitz"+string(global.timer)+".ini"
				global.STATS_gamemode = "blitz_"+string(global.timer)
				global.STATS_points = Gamerule_1.points
				break;
			case rm_classic:
				room_to_go = rm_stats_normal
				if !file_exists("Stats/stats_classic.ini") stats_create_classic()
				global.STATS_file = "stats_classic.ini"
				global.STATS_gamemode = "classic"
				global.STATS_points = Gamerule_1.points
				global.STATS_level = Gamerule_1.level
				break;
			case rm_compact:
				room_to_go = rm_stats_normal
				if !file_exists("Stats/stats_compact.ini") stats_create_compact()
				global.STATS_file = "stats_compact.ini"
				global.STATS_gamemode = "compact"
				global.STATS_points = Gamerule_1.points
				global.STATS_level = Gamerule_1.level
				break;
			case rm_buyobuyo:
				global.STATS_points = Gamerule_1.points
				global.STATS_file = "stats_buyo.ini"
				global.STATS_gamemode = "buyo"
				global.STATS_level = Gamerule_1.level
				if !file_exists("Stats/"+global.STATS_file) stats_create_buyo()
				break;
			default:
				room_to_go = rm_menu
				has_level = false
				break;
		}
	
		if (!global.replay_match_isplaying) gameover_update_stats(has_level)

}
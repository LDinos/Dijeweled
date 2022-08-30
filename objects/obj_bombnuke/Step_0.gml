/// @description Insert description here
// You can write your code in this editor
func += 0.02
image_angle+=5
image_xscale = lerp(0.1,5,power(func,2.5))
image_yscale = image_xscale
if func >= 1
{
	if !done
	{
		done = true
		var leave = instance_create(0,0,obj_white_fade)
		if (!Gamerule_1.isQuest)
		{
			var has_level = true
			switch room
			{
				case rm_timeattack:
					leave.room_to_go = rm_stats_normal
					if !file_exists("Stats/stats_arcade.ini") stats_create_arcade()
					global.STATS_file = "stats_arcade.ini"
					global.STATS_gamemode = "arcade"
					global.STATS_points = Gamerule_1.points
					global.STATS_level = Gamerule_1.level
					break;
				case rm_twist:
					leave.room_to_go = rm_stats_normal
					if !file_exists("Stats/stats_twist.ini") stats_create_twist()
					global.STATS_file = "stats_twist.ini"
					global.STATS_gamemode = "twist"
					global.STATS_points = Gamerule_1.points
					global.STATS_level = Gamerule_1.level
					break;
				case rm_swift:
					leave.room_to_go = rm_stats_normal
					if !file_exists("Stats/stats_swift.ini") stats_create_swift()
					global.STATS_file = "stats_swift.ini"
					global.STATS_gamemode = "swift"
					global.STATS_points = Gamerule_1.points
					global.STATS_level = Gamerule_1.level
					break;
				case rm_survivor:
					leave.room_to_go = rm_stats_survivor
					if !file_exists("Stats/stats_survivor.ini") stats_create_survivor()
					global.STATS_file = "stats_survivor.ini"
					global.STATS_gamemode = "survivor"
					global.STATS_points = Gamerule_1.Moves_Made
					has_level = false
					break;
				case rm_blitz:
					leave.room_to_go = rm_stats_blitz
					if !file_exists("Stats/stats_blitz"+string(global.timer)+".ini") stats_create_blitz()
					global.STATS_file = "stats_blitz"+string(global.timer)+".ini"
					global.STATS_gamemode = "blitz_"+string(global.timer)
					global.STATS_points = Gamerule_1.points
					break;
				default:
					leave.room_to_go = rm_menu
					has_level = false
					break;
			}
			gameover_update_stats(has_level)
		}
		else
		{
			leave.room_to_go = rm_menu_challenges
		}
	}
}
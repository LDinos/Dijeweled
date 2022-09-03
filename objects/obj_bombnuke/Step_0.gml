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
					break;
				case rm_twist:
					leave.room_to_go = rm_stats_normal
					break;
				case rm_swift:
					leave.room_to_go = rm_stats_normal
					break;
				case rm_survivor:
					leave.room_to_go = rm_stats_survivor
					has_level = false
					break;
				case rm_blitz:
					leave.room_to_go = rm_stats_blitz
					has_level = false
					break;
				default:
					leave.room_to_go = rm_menu
					has_level = false
					break;
			}
			gameover(has_level)
		}
		else
		{
			leave.room_to_go = rm_menu_challenges
		}
	}
}
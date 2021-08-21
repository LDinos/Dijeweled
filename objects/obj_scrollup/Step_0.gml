/// @description Insert description here
if mouse_check_button_pressed(mb_left)
{
	if position_meeting(mouse_x,mouse_y,id)
	{
		if obj_challenges_room.page > 0
		{
			obj_challenges_room.page--
			instance_destroy(obj_editdelete)
			with(obj_challenges_selection)
			{
				index -= 6
				read_custom_quest_info()
			}		
		}
	}
}
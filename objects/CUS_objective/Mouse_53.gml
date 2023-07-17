/// @description Insert description here
if obj_CUS_general.canclick && hasinput
{
	if position_meeting(mouse_x,mouse_y,id)
	{
		obj_CUS_general.canclick = false
		msg = get_integer_async("Set Value", min_val)
	}
} 


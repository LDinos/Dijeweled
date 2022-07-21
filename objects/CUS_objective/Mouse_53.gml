/// @description Insert description here
if obj_CUS_general.canclick && hasinput
{
	if position_meeting(mouse_x,mouse_y,id)
	{
		var num = get_integer("Set Value", min_val)
		num = clamp(num, min_val, max_val)
		text2 = string(num)
	}
} 


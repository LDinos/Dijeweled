if obj_CUS_general.canclick
{
	if position_meeting(mouse_x,mouse_y,id)
	{
		obj_CUS_general.canclick = false
		msg = get_string_async("Set Quest Description", value)
	}
}
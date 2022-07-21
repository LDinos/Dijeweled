if obj_CUS_general.canclick
{
	if position_meeting(mouse_x,mouse_y,id)
	{
		var txt = get_string("Set Quest Description", value)
		if (string_length(txt) <= max_val) value = txt
	}
}
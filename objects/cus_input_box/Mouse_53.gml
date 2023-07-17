if obj_CUS_general.canclick {
	if position_meeting(mouse_x,mouse_y,id) {
		if (box_type == BOX_TYPE_TICK) set_value(!value)
		else {
			msg = get_integer_async("Type your value", value)
			obj_CUS_general.canclick = false
		}	
	}
}
if obj_CUS_general.canclick {
	if position_meeting(mouse_x,mouse_y,id) {
		if (box_type == BOX_TYPE_TICK) value = !value
		else {
			var num = get_integer("Input help", value)
			if !is_real(num) num = value
			else num = clamp(num, min_val, max_val)
			value = string(num)
		}
		set_value(value)
	}
}
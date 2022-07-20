/// @description Insert description here
if unable //if we are currently binding a key
{
	var b = gamepad_lastkey(gamepad_id)
	if b != -1 && b != gp_padu && b != gp_padd && b != gp_padl && b != gp_padr && b != gp_start && b != gp_axisrh && b != gp_axisrv && b != gp_axislh && b != gp_axislv
	{
		B_list[click,0] = b
		ini_open("binds.ini")
			ini_write_real("binds",B_list[click,2],b)
		ini_close()
		click = -1
		unable = false
		read_gamepad_binds()
	}
} else {
	if (gamepad_id != noone) {
		var pressed_enter = gamepad_button_check_pressed(gamepad_id, gp_face1)
		var dir_v = gamepad_button_check_pressed(gamepad_id, gp_padd) - gamepad_button_check_pressed(gamepad_id, gp_padu)	
		if (dir_v != 0) {
			hover += dir_v
			if (hover > array_length(B_list)) hover = 0
			else if (hover < 0) hover = array_length(B_list)
			if (hover == array_length(B_list)) with(obj_bindings_return) event_perform(ev_mouse, ev_mouse_enter)
			else with(obj_bindings_return) event_perform(ev_mouse, ev_mouse_leave)
		}
		else if (pressed_enter) && (hover >= 0) {
			if (hover == array_length(B_list)) with(obj_bindings_return) event_perform(ev_mouse, ev_left_press)
			else {
				click = hover
				unable = true
			}
		}
	}
}
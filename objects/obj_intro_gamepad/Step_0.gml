/// @description
if (gamepad_id != noone) {
	var pressed_enter = gamepad_button_check_pressed(gamepad_id, gp_face1) 
		|| gamepad_button_check_pressed(gamepad_id, gp_face2)
		|| gamepad_button_check_pressed(gamepad_id, gp_face3)
		|| gamepad_button_check_pressed(gamepad_id, gp_face4)

	if (pressed_enter) {
		with(obj_intro) {
			click()
		}
	}
}
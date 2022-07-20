/// @description
if (gamepad_id != noone) {
	var dir_v = gamepad_button_check_pressed(gamepad_id, gp_padd) - gamepad_button_check_pressed(gamepad_id, gp_padu)
	var dir_h = gamepad_button_check_pressed(gamepad_id, gp_padr) - gamepad_button_check_pressed(gamepad_id, gp_padl)
	var pressed_enter = gamepad_button_check_pressed(gamepad_id, gp_face1)
	var butt = button_manager[gamepad_button_index.row, gamepad_button_index.col]
	switch(gamepad_button_state) {
		case FREE:
			if (dir_v != 0) gamepad_move_vertically(dir_v)
			else if (dir_h != 0) gamepad_move_horizontally(dir_h)
			else if pressed_enter {
				var is_vol = gamepad_button_index.col == 1 && (gamepad_button_index.row >= 0 && gamepad_button_index.row <= 2)
				if !is_vol {
					with(butt) event_perform(ev_mouse, ev_left_press)
				}
				else {
					with(butt) gamepad_selected = true
					gamepad_button_state = VOLUME
				}
			}
			break;
		case VOLUME:
			if (dir_h != 0) {
				with(butt) gamepad_move_slider(dir_h)
			}
			else if (pressed_enter) {
				with(butt) gamepad_selected = false
				gamepad_button_state = FREE
				write_volume_changes()
			}
			break;
	}
}

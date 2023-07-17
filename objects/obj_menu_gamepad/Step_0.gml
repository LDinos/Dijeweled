/// @description
if (gamepad_id != noone) {
	
	var pressed_enter = gamepad_button_check_pressed(gamepad_id, gp_face1)
	var dir = gamepad_button_check_pressed(gamepad_id, gp_padd) - gamepad_button_check_pressed(gamepad_id, gp_padu)
	var dir_leftright = gamepad_button_check_pressed(gamepad_id, gp_padr) - gamepad_button_check_pressed(gamepad_id, gp_padl)
	
	switch(room) {
		case rm_menu_saverep:
			var butt_master = obj_menu_buttons_master
			if (dir_leftright != 0) generic_move_horizontally(butt_master, dir_leftright)
			else if (pressed_enter) {
				var butt = butt_master.current_group[current_butt]
				with(butt) event_perform(ev_mouse, ev_left_press)
			}
			break;
		case rm_menu:
			var butt_master = obj_menu_buttons_master
			if (instance_exists(obj_neworcontinue)) {
				if (dir_leftright != 0) {
					menu_dialog_change_button(dir_leftright)
				} else if (pressed_enter) {
					var butt = obj_neworcontinue.button_manager[current_butt_newcontinue]
					with(butt) event_perform(ev_mouse, ev_left_press)
				}
			}
			else {
				menu_always_find_a_button(butt_master, 1)
				if (dir != 0) {
					menu_change_button(butt_master, dir)
					menu_always_find_a_button(butt_master, dir)
					menu_hover_at_button(butt_master)
					break;
				}
				if (pressed_enter) {
					menu_press_button(butt_master)
				}
			}
			break;
		case rm_menu_stats:
			if (dir_leftright != 0) menu_stats_change_horizontal(dir_leftright)
			else if (dir != 0) menu_stats_change_vertical(dir)
			else if pressed_enter menu_stats_press_button()		
			break;
		case rm_menu_credits:
			if (pressed_enter) room_goto(rm_menu)
			break;
		case rm_menu_challenges:
			var button_master = obj_challenges_room
			if (dir_leftright != 0) quests_move_horizontally(dir_leftright, button_master)
			else if (dir != 0) quests_move_vertically(dir, button_master)
			else if (pressed_enter) && (current_butt_quests.i != 0) {
				with(button_master.quests_buttons[current_butt_quests.i][current_butt_quests.j]) event_perform(ev_mouse, ev_left_press)
			}
			break;
		case rm_stats_blitz:
		case rm_stats_countdown:
		case rm_stats_normal:
		case rm_stats_survivor:
			if (pressed_enter) {
				var butt = obj_button_statscontinue
				with(butt) event_perform(ev_mouse, ev_left_press)
			}
			break;
	}
}

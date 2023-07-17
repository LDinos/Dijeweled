/// @description
current_butt = 0 //current button index in menu
current_butt_newcontinue = 0 //current button index in "new or continue" dialog
current_butt_menu_stats_h = 1 // 0 = left, 1 = back, 2 = right
current_butt_menu_stats_v = 3 // 0 = left, 1 = back, 2 = right
current_butt_quests = {i : 0, j : 0}
menu_stats_buttons = [[noone, noone, noone],
					  [noone, noone, noone],
					  [obj_button_stats_online, obj_button_stats_online, obj_button_stats_online],
					  [obj_stats_M_button_left, obj_button_stats_back, obj_stats_M_button_right]
					 ]
function find_gamepad() {
	gamepad_id = noone
	var gp_num = gamepad_get_device_count();
	for (var i = 0; i < gp_num; i++;) {
		if (gamepad_is_connected(i)) {
			gamepad_id = i
			break;
		}
	}
}

function menu_always_find_a_button(butt_master, dir) {
	while(butt_master.current_group[current_butt] == noone) {
		if (butt_master.current_group[current_butt] == noone) menu_change_button(butt_master, dir)
	}
}

function menu_change_button(butt_master, dir) {
	current_butt += dir
	if (current_butt >= array_length(butt_master.current_group)) current_butt = 0
	else if (current_butt < 0) current_butt = array_length(butt_master.current_group) -1
}

function menu_hover_at_button(butt_master) {
	var butt = butt_master.current_group[current_butt]
	for(var i = 0; i < array_length(butt_master.current_group); i++) {
		with(butt_master.current_group[i]) event_perform(ev_mouse, ev_mouse_leave)
	}
	with(butt) event_perform(ev_mouse, ev_mouse_enter)
}

function menu_press_button(butt_master) {
	with(butt_master.current_group[current_butt]) event_perform(ev_mouse, ev_left_press)
	menu_always_find_a_button(butt_master, 1)
}

function menu_dialog_change_button(dir) {
	current_butt_newcontinue += dir
	if (current_butt_newcontinue) >= array_length(obj_neworcontinue.button_manager) current_butt_newcontinue = 0
	else if (current_butt_newcontinue) < 0 current_butt_newcontinue = array_length(obj_neworcontinue.button_manager)-1
	var butt = obj_neworcontinue.button_manager[current_butt_newcontinue]
	for(var i = 0; i < array_length(obj_neworcontinue.button_manager); i++) {
		with(obj_neworcontinue.button_manager[i]) event_perform(ev_mouse, ev_mouse_leave)
	}
	with(butt) event_perform(ev_mouse, ev_mouse_enter)
}

function menu_stats_change_vertical(dir) {
	do {
		if (current_butt_menu_stats_v + dir >= array_length(menu_stats_buttons)) {
			current_butt_menu_stats_v = 0
		} else if (current_butt_menu_stats_v + dir < 0) {
			current_butt_menu_stats_v = array_length(menu_stats_buttons) - 1
		}
		else current_butt_menu_stats_v += dir
		if (menu_stats_buttons[current_butt_menu_stats_v][current_butt_menu_stats_h] == noone) dir += sign(dir)
		
	} until (menu_stats_buttons[current_butt_menu_stats_v][current_butt_menu_stats_h] != noone)
	
	for(var i = 0; i < array_length(menu_stats_buttons); i++) {
		for(var j = 0; j < array_length(menu_stats_buttons[0]); j++) {
			var other_butt = menu_stats_buttons[i][j]
			with(other_butt) event_perform(ev_mouse, ev_mouse_leave)
		}
	}
	var butt = menu_stats_buttons[current_butt_menu_stats_v][current_butt_menu_stats_h]
	with(butt) event_perform(ev_mouse, ev_mouse_enter)
}

function menu_stats_change_horizontal(dir) {
	do {
		if (current_butt_menu_stats_h + dir >= array_length(menu_stats_buttons[0])) {
			current_butt_menu_stats_h = 0
		} else if (current_butt_menu_stats_h + dir < 0) {
			current_butt_menu_stats_h = array_length(menu_stats_buttons[0]) - 1
		}
		else current_butt_menu_stats_h += dir
		if (menu_stats_buttons[current_butt_menu_stats_v][current_butt_menu_stats_h] == noone) dir += sign(dir)
		
	} until (menu_stats_buttons[current_butt_menu_stats_v][current_butt_menu_stats_h] != noone)
	
	for(var i = 0; i < array_length(menu_stats_buttons); i++) {
		for(var j = 0; j < array_length(menu_stats_buttons[0]); j++) {
			var other_butt = menu_stats_buttons[i][j]
			with(other_butt) event_perform(ev_mouse, ev_mouse_leave)
		}
	}
	var butt = menu_stats_buttons[current_butt_menu_stats_v][current_butt_menu_stats_h]
	with(butt) event_perform(ev_mouse, ev_mouse_enter)
}

function menu_stats_press_button() {
	var butt = menu_stats_buttons[current_butt_menu_stats_v][current_butt_menu_stats_h]
	with(butt) event_perform(ev_mouse, ev_left_press)
}

function quests_move_horizontally(dir, master) {
	if (current_butt_quests.i == 0) { //if we are at quest categories (top of the screen)
		master.change_to_quest(clamp(master.index + dir, 0, 26))
	} else current_butt_quests.j += dir
	if (current_butt_quests.j >= array_length(master.quests_buttons[0])) current_butt_quests.j = 0
	else if (current_butt_quests.j < 0) current_butt_quests.j = array_length(master.quests_buttons[0])-1
	quests_unhover_all(master)
	var butt = master.quests_buttons[current_butt_quests.i][current_butt_quests.j]
	with(butt) event_perform(ev_mouse, ev_mouse_enter)
}

function quests_move_vertically(dir, master) {
	current_butt_quests.i += dir
	if (current_butt_quests.i >= array_length(master.quests_buttons)) current_butt_quests.i = 0
	else if (current_butt_quests.i < 0) current_butt_quests.i = array_length(master.quests_buttons)-1
	quests_unhover_all(master)
	var butt = master.quests_buttons[current_butt_quests.i][current_butt_quests.j]
	with(butt) event_perform(ev_mouse, ev_mouse_enter)
}

function quests_unhover_all(master) {
	for(var i = 0; i < array_length(master.quests_buttons); i++) {
		for(var j = 0; j < array_length(master.quests_buttons[0]); j++) {
			var butt = master.quests_buttons[i][j]
			with(butt) event_perform(ev_mouse, ev_mouse_leave)
		}
	}
}

function generic_move_horizontally(master, dir) {
	if (current_butt + dir >= array_length(master.current_group)) {
		current_butt = 0
	} else if (current_butt+dir) < 0 {
		current_butt = array_length(master.current_group)-1
	} else current_butt += dir
	
	for(var i = 0; i < array_length(master.current_group); i++) {
		with(master.current_group[i]) event_perform(ev_mouse, ev_mouse_leave)
	}
	with(master.current_group[current_butt]) event_perform(ev_mouse, ev_mouse_enter)
	
}

find_gamepad()
/// @description
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

function menu_dialog_change_button() {
	if (current_butt_newcontinue) == 0 current_butt_newcontinue = 1
	else current_butt_newcontinue = 0
	var butt = obj_neworcontinue.button_manager[current_butt_newcontinue]
	for(var i = 0; i < array_length(obj_neworcontinue.button_manager); i++) {
		with(obj_neworcontinue.button_manager[i]) event_perform(ev_mouse, ev_mouse_leave)
	}
	with(butt) event_perform(ev_mouse, ev_mouse_enter)
}

function menu_stats_change_button(dir) {
	var butt_list = []
	butt_list[0] = obj_stats_M_button_left
	butt_list[1] = obj_button_stats_back
	butt_list[2] = obj_stats_M_button_right
	
	current_butt_menu_stats += dir
	if (current_butt_menu_stats < 0 ) current_butt_menu_stats = 2
	else if (current_butt_menu_stats >= array_length(butt_list)) current_butt_menu_stats = 0
	var butt = butt_list[current_butt_menu_stats]
	for(var i = 0; i < array_length(butt_list); i++) {
		with(butt_list[i]) event_perform(ev_mouse, ev_mouse_leave)
	}
	with(butt) event_perform(ev_mouse, ev_mouse_enter)
}

function menu_stats_press_button() {
	var butt_list = []
	butt_list[0] = obj_stats_M_button_left
	butt_list[1] = obj_button_stats_back
	butt_list[2] = obj_stats_M_button_right
	var butt = butt_list[current_butt_menu_stats]
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

current_butt = 0 //current button index in menu
current_butt_newcontinue = 0 //current button index in "new or continue" dialog
current_butt_menu_stats = 1 // 0 = left, 1 = back, 2 = right
current_butt_quests = {i : 0, j : 0}
find_gamepad()
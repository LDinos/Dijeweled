/// @description
global_stats = !global_stats
if (global_stats) {
	instance_destroy(obj_stats)
	var s = instance_create(0,0,obj_stats_online)
	s.request_stats()
	instance_create(room_width/2, 32+32+320+32, obj_stats_M_button_up)
	instance_create(room_width/2, 32+32+320+32+32, obj_stats_M_button_down)
	with(obj_menu_gamepad) {
		menu_stats_buttons = [[obj_stats_M_button_up, obj_stats_M_button_up, obj_stats_M_button_up],
							[obj_stats_M_button_down, obj_stats_M_button_down, obj_stats_M_button_down],
							[obj_button_stats_online, obj_button_stats_online, obj_button_stats_online],
							[obj_stats_M_button_left, obj_button_stats_back, obj_stats_M_button_right]
							]
	}
}
else {
	instance_destroy(obj_stats_online)
	instance_destroy(obj_stats_M_button_up)
	instance_destroy(obj_stats_M_button_down)
	var s = instance_create(0,0,obj_stats)
	s.open_stats()
	with(obj_menu_gamepad) {
		menu_stats_buttons = [[noone, noone, noone],
							[noone, noone, noone],
							[obj_button_stats_online, obj_button_stats_online, obj_button_stats_online],
							[obj_stats_M_button_left, obj_button_stats_back, obj_stats_M_button_right]
							]
	}
}


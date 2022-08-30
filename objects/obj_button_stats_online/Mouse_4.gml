/// @description
global_stats = !global_stats
if (global_stats) {
	instance_destroy(obj_stats)
	var s = instance_create(0,0,obj_stats_online)
	s.request_stats(s.stats_array[s.stats_index])
	instance_create(room_width/2, 32+32+320+32, obj_stats_M_button_up)
	instance_create(room_width/2, 32+32+320+32+32, obj_stats_M_button_down)
}
else {
	instance_destroy(obj_stats_online)
	instance_destroy(obj_stats_M_button_up)
	instance_destroy(obj_stats_M_button_down)
	var s = instance_create(0,0,obj_stats)
	s.open_stats()
}


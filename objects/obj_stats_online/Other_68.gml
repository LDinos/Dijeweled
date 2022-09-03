/// @description
var t = ds_map_find_value(async_load, "type")
if (t == network_type_non_blocking_connect) {
	var online = ds_map_find_value(async_load, "succeeded")
	if (online == 1) {
		request_stats()
	} else stats_failed = true
}
else if (t == network_type_data) {
	stats_loaded = true
	stats_board = []
	var buffer2 = ds_map_find_value(async_load, "buffer")
	var raw_data = buffer_read(buffer2, buffer_text)
	var data = json_parse(raw_data)
	
	var users_array = variable_struct_get_names(data)
	for(var i = 0; i < array_length(users_array); i++) {
		var user_struct = variable_struct_get(data, users_array[i])
			var points = user_struct[$ "points"]
			var style = user_struct[$ "style"]
			var matches = user_struct[$ "matches"]
			stats_board[i][0] = users_array[i]
			stats_board[i][POINTS] = points
			stats_board[i][STYLE] = style
			stats_board[i][MATCHES] = matches
	}
	order(stats_order)
}


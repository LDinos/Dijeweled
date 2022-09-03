/// @description
var t = ds_map_find_value(async_load, "type")
if (t == network_type_non_blocking_connect) {
	var online = ds_map_find_value(async_load, "succeeded")
	if (online == 1) {
		animate = false
		var gm = "time_attack_"+string(global.default_timer)
		var stats = {
			"gamemode" : gm,
			"user" : global.user,
			"points" : Gamerule_1.points,
			"style" : Gamerule_1.style,
			"matches" : Gamerule_1.matches
		}
		buffer_seek(buffer,buffer_seek_start,0)
		buffer_write(buffer,buffer_text,json_stringify(stats))
		network_send_raw(client_socket,buffer,buffer_tell(buffer))
		text = "Stats uploaded!"
		network_destroy(client_socket)
	} else {
		text = "Unable to upload"
		animate = false
		network_destroy(client_socket)
	}
}


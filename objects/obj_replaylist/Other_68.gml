/// @description
var t = ds_map_find_value(async_load, "type")
if (t == network_type_non_blocking_connect) {
	var online = ds_map_find_value(async_load, "succeeded")
	if (online == 1) {
		tooltip_show("Successfully connected to Replay database", c_green, 60*2)
	} 
	else {
		network_loading = false
		network_failed = true
		tooltip_show("Error connecting to Replay database", c_red, 2*SECOND)
	}
}
else if (t == network_type_data) {
	network_failed = false
	network_loading = false
	var buffer2 = ds_map_find_value(async_load, "buffer")
	var raw_data = buffer_read(buffer2, buffer_text)
	var data = json_parse(raw_data)

	if (data.response == "retrieve_replays") {
		show_debug_message("retrieve_replays")
		if(data.status == "error") {
			tooltip_show("Error: " + data.error , c_red)
		}
		else {
			parse_requested_replays(data.data)
		}
	}
	else if (data.response == "replay_upload") {
		show_debug_message("replay_upload")
		network_uploading = false
		if (data.status == "error") {
			tooltip_show("Error: " + data.error , c_red)
		}
		else {
			update_uploaded_file()
			tooltip_show("Successful replay upload with Id: " + string(data.id) , c_green)
		}
		uploading_file = -1
	}
	else if (data.response == "getData") {
		show_debug_message(data)
		network_uploading = false
		if (data.status == "error") {
			tooltip_show("Error: " + data.error , c_red)
		}
		else {
			finalize_download(data.data)
		}
	}
}


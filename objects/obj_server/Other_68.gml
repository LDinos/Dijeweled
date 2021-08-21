var n_id = ds_map_find_value(async_load, "id");

//if n_id == server_socket
    {
	//
    var t = ds_map_find_value(async_load, "type");
    switch(t)
        {
        case network_type_connect:
            var sock = ds_map_find_value(async_load, "socket")
            client_socket = sock
			client_connected = true
            break;
        case network_type_disconnect:
			if room != rm_lobby
			{
				room_goto(rm_menu)
	            client_socket = noone
				client_connected = false
				instance_destroy()
				audio_stop_all()
			}
			else
			{
				with(obj_chat) chat_write( global.user2 + " has disconnected.", c_yellow)
				with(LOB_circle) {enabled = false; 	canclick = true;}
				with(LOB_circle2) {enabled = false;}
				client_connected = false
				client_socket = noone
			}
            break;
        case network_type_data:
            //Data handling here...
			ip = ds_map_find_value(async_load, "ip");
			var buffer2 = ds_map_find_value(async_load, "buffer")
			scr_recieved_packet(buffer2)
            break;
        }
    }

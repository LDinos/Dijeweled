var n_id = ds_map_find_value(async_load, "id");
    {
		if( n_id == soc)
		{
			var t = ds_map_find_value(async_load, "type");
			switch(t)
	        {
		        case network_type_data:
					var msg_rec = ds_map_find_value(async_load, "buffer")
					scr_TFJ_handler(buffer_read(msg_rec,buffer_string))
		            break
				case network_type_disconnect:
					room_goto(rm_menu)
					show_message("disconnected")
					instance_destroy()
					break
	        }
		}
    }
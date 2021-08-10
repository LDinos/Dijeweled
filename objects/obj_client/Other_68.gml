/// @description Insert description here
// You can write your code in this editor
if server >= 0
{
	var n_id = ds_map_find_value(async_load, "id");
	//if n_id == client_socket
    {
		var t = ds_map_find_value(async_load, "type");
    switch(t)
        {
        case network_type_data:
            //Data handling here...
			var buffer2 = ds_map_find_value(async_load, "buffer")
			scr_recieved_packet(buffer2)
            break;
		case network_type_disconnect:
			room_goto(rm_menu)
			instance_destroy()
			break;
        }
    }
}


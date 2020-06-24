/// @description Insert description here
if keyboard_check_pressed(vk_anykey) {consecutive_writing = 0; consecutive_first = true}
if keyboard_check(vk_anykey)
{
	if keyboard_islastkey_numletter() || keyboard_lastkey == vk_space
	{
		if consecutive_writing <= 0
		{
			if consecutive_first {consecutive_writing = 15; consecutive_first = false}
			else {consecutive_writing = 2}
		//alarm[1] = 15
			if (string_width(global.user) + string_width(text) < 452) text += keyboard_lastchar
		}
		else consecutive_writing--
	}
	else if keyboard_lastkey == vk_backspace
	{
		if consecutive_writing <= 0
		{
			if consecutive_first {consecutive_writing = 15; consecutive_first = false}
			else {consecutive_writing = 2}
			//alarm[1] = 15
			text = string_delete(text,string_length(text),1)
		}
		else consecutive_writing--
	}
	else if keyboard_lastkey == vk_enter && text != ""
	{
		consecutive_writing = 0
		consecutive_first = true
		alarm[1] = -1
		var txt = global.user + ": " + text
		text = chat_write(txt,c_white)		
		with(global.mynet)
		{
			buffer_seek(buffer,buffer_seek_start,0)
			buffer_write(buffer,buffer_u8,NN_CHAT)
			buffer_write(buffer,buffer_string,txt)
			network_send_packet(client_socket,buffer,buffer_tell(buffer))
		}				
	}
}
//else {consecutive_writing = 0; consecutive_first = true}
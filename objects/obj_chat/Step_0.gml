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
			if !keyboard_check(vk_shift) || (consecutive_writing != 2)
			{
				if (string_width(global.user) + string_width(text) < 452) text += keyboard_lastchar
			}

			/*if (consecutive_writing == 2) && !keyboard_check(vk_shift){
			if (string_width(global.user) + string_width(text) < 452) text += keyboard_lastchar}*/
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
		send_message()			
	}
}
//else {consecutive_writing = 0; consecutive_first = true}
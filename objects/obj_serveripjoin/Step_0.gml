/// @description Insert description here
// You can write your code in this editor
if (os_type != os_android) {
	if mouse_check_button_pressed(mb_right)
	{
		var copied_msg = clipboard_get_text()
		if string_length(copied_msg) <= text_length
		{
			field = clipboard_get_text();
			convert = true
		}
	}
	else if mouse_check_button_pressed(mb_middle) hide_ip = !hide_ip

	if keyboard_check_pressed(vk_enter)
	    {
			join()
	    }

	if keyboard_check_pressed(vk_backspace)
	    {
	    if once field = string_delete(field, string_length(field), 1);
		else
			{
				field = ""
				once = true
			}
		convert = true
	    }
	else if keyboard_check_pressed(vk_anykey)
	    {
	    if keyboard_lastchar != "\\" && keyboard_lastchar != "/"//(keyboard_lastkey > 48 && keyboard_lastkey  < 91) || keyboard_lastchar = "." || keyboard_lastchar = "0"
	        {		
	        if string_length(field) <= text_length
	            {
					convert = true
					if !once {field = "";once = true}
	                field = string(field) + string(keyboard_lastchar)   
	            } 
	        }
	    }
	if convert
	{
		field_converted = ""
		for(var i = 0; i < string_length(field); i++)
		{
			var char_to_add = "."
			if string_char_at(field,i+1) != "."
			{
				char_to_add = "x"
			}
			field_converted += char_to_add
		}
		convert = false
	}
}


/// @description Insert description here
if on_focus
{
	var len = string_length(value) 
	if keyboard_check_pressed(vk_backspace)
	{
		//if (len > 0)
			{
				value = string_delete(value,len,1)
			}
	}
	else if keyboard_check_pressed(vk_anykey)
	{
		if (keyboard_lastkey >= 48 && keyboard_lastkey <= 57)
			{
				if (value == "0") value = ""
				var newnum = real(value+keyboard_lastchar)
				if (newnum <= max_val && newnum >= min_val)
				{
					value += keyboard_lastchar
				}
				else if (newnum > max_val) value = string(max_val)
				else value = string(min_val)
			}
	}
}
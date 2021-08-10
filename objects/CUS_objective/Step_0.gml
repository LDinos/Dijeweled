/// @description Insert description here
if on_focus && hasinput
{
	var len = string_length(text2) 
	if keyboard_check_pressed(vk_backspace)
	{
		//if (len > 0)
			{
				text2 = string_delete(text2,len,1)
			}
	}
	else if keyboard_check_pressed(vk_anykey)
	{
		if (keyboard_lastkey >= 48 && keyboard_lastkey <= 57)
			{
				var newnum = real(text2+keyboard_lastchar)
				if (newnum <= max_val && newnum >= min_val)
				{
					text2 += keyboard_lastchar
				}
				else if (newnum > max_val) text2 = string(max_val)
				else text2 = string(min_val)
			}
	}
}

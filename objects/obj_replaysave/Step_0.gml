/// @description Insert description here

if window_has_focus()
{
	if keyboard_check_pressed(vk_anykey)
	{
		alarm[1] = 15
		text2 = keyboard_lastkey
		if (text2 == 8) //backspace
		{
			text = string_delete(text,string_length(text),1)
		}
		else if (text2 >= 65 && text2 <=90) || (text2 >= 48 && text2 <=57) || text2 == vk_space//a to z or 0 to 9
		{
			if string_width(text) < 495
			{
				if !keyboard_check(vk_shift) && !keyboard_check(vk_alt) && !keyboard_check(vk_control)
				{
					if text2 == vk_space
					{
						if (string_length(text) != 0) && (string_char_at(text,string_length(text)) != " ") text = text + " "
					}
					else text = text + keyboard_lastchar
				}
			}
		}
	}
}

if keyboard_check_released(vk_anykey) alarm[1] = -1


/// @description Insert description here
y = obj_CUS_coals.y + 5*16
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
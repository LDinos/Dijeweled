/// @description Insert description here
if on_focus
{
	var len = string_length(value) 
	if keyboard_check_pressed(vk_backspace)
	{
		if !firsttime
			{
				value = string_delete(value,len,1)
			}
		else {value = ""; firsttime = false}
	}
	else if keyboard_check_pressed(vk_anykey)
	{
		if keyboard_islastkey_numletter() || keyboard_lastchar == "'" || keyboard_lastchar == "-"
		{
			if firsttime {value = ""; firsttime = false}
			if len < 65
			{
				value += keyboard_lastchar
			}
		}
	}
}
/// @description Insert description here
if keyboard_check(vk_anykey)
{
	if keyboard_check(vk_backspace)
	{
		text = string_delete(text,string_length(text),1)
	}
	else if keyboard_islastkey_numletter() || keyboard_lastkey == vk_space
	{
		if (string_width(global.user) + string_width(text) < 452) text += keyboard_lastchar
	}
	alarm[1] = 4
}
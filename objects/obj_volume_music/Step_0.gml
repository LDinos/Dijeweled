/// @description Insert description here
if amclicked
{	
	var dif = mouse_x - x
	if dif > 0
	{
		if dif < sprite_width
		{
			global.VolMus = dif/sprite_width
		}
		else global.VolMus = 1
	}
	else global.VolMus = 0
	audio_group_set_gain(audiogroup_music,global.VolMus,0)
}
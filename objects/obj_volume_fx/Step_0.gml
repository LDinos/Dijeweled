/// @description Insert description here
if amclicked
{	
	var dif = mouse_x - x
	if dif > 0
	{
		if dif < sprite_width
		{
			global.VolFX = dif/sprite_width
		}
		else global.VolFX = 1
	}
	else global.VolFX = 0
	audio_group_set_gain(audiogroup_default,global.VolFX,0)
}
/// @description Insert description here
if amclicked
{	
	var dif = mouse_x - x
	if dif > 0
	{
		if dif < sprite_width
		{
			global.VolVO = dif/sprite_width
		}
		else global.VolVO = 1
	}
	else global.VolVO = 0
	audio_group_set_gain(audiogroup_voice,global.VolVO,0)
}
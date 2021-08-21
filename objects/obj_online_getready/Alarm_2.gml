/// @description Start music
if global.SET_gamemode == 0
{
	if deftime > 180 audio_play_sound(mus_5min,0,false)
	else if deftime > 60 audio_play_sound(mus_3min,0,false)
	else audio_play_sound(mus_1min,0,false)
	instance_destroy()
}

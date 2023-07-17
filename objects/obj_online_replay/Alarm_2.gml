/// @description
if global.SET_gamemode == 0
{
	if global.timer > 180 audio_play_sound(mus_5min,0,false)
	else if global.timer > 60 audio_play_sound(mus_3min,0,false)
	else audio_play_sound(mus_1min,0,false)
}



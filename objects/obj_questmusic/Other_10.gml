/// @description Start music
audio_play_sound(mus_main,0,true)
if danger_enable
{
	audio_play_sound(mus_danger,0,true)
	audio_sound_gain(mus_danger,0,0)
}

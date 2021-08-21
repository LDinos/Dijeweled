/// @description fade in
image_alpha += 0.05
if image_alpha < 1 alarm[0] = 1
else
{
	audio_play_sound(snd_lvlcomp_02,0,0)
	alarm[2] = 40
}
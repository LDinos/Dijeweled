/// @description Insert description here
func+=0.05
y = lerp(yy,ytogo,power(func,2))
x = lerp(xx,xtogo,power(func,2))
if func < 1 alarm[0] = 1
else
{
	with(obj_xplier)
	{
		event_user(0)
	}
	audio_play_sound(snd_spermdrop,0,0)
	instance_destroy()
}
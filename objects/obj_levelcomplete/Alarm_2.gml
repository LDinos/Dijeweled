/// @description Bring whiteness
perc += 0.01
xtouse = lerp(0,room_width,perc)
if perc < 1 alarm[2] = 1
else
{
	audio_stop_sound(snd_lvlcomp_01)
	alarm[3] = 20
	with(obj_background_shadered)
	{
		if ds_map_exists(Gamerule_1.Replay_map,"background_nextlevel")
		{
			shd = Gamerule_1.Replay_map[? "background_nextlevel"]
		}
		else
		{
			if (shd == num_shaders) shd = 0
			else shd++
		}
	}
	with(obj_makezenbkg) event_user(0)
}

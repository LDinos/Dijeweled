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
			/*var shdbefore = shd
			do
			{
			shd = irandom(num_shaders)
			}until shd != shdbefore*/
		}
	}
	with(obj_makezenbkg) event_user(0)
	/*
	var lay_id = layer_get_id("bg_BOT");
	var back_id = layer_background_get_id(lay_id);
	{
		var current = layer_background_get_index(back_id)
		var now;
		
		do
		{
			now = irandom(4)
		}
		until current != now
		
		layer_background_index(back_id,now)
	}*/
}

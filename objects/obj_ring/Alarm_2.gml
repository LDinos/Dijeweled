/// @description counter++
with(Gamerule_1)
{
	with(list_of_doom) {audio_play_sound(glugk,1,0); countdown += 4}
	for(var i = 0; i<ds_list_size(list_of_bombs);i++)
	{
		with(list_of_bombs[| i]) {audio_play_sound(glugk,1,0); countdown += 4}
	}
}


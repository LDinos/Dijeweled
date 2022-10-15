/// @description checking for condition first
// You can write your code in this editor
if Gamerule_local.IsGemActive2
{
	if num_powers(Gamerule_local) > 0
	{
		i = 0
		j = 0
		alarm[1] = 5
	}
	else
	{
		//audio_play_sound(vo_gameover,0,false)
		with(obj_rotator) event_user(0)
		network_send(NN_MATCH_TIMEUP)
	}
}
else alarm[0] = 1
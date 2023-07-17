/// @description checking for condition first
// You can write your code in this editor
if Gamerule_1.IsGemActive2
{
	if num_powers(Gamerule_1) > 0
	{
		i = 0
		j = 0
		alarm[1] = 5
	}
	else
	{
		//audio_play_sound(vo_gameover,0,false)
		with(obj_rotator) event_user(0)
		with(global.mynet)
		{
			buffer_seek(buffer,buffer_seek_start,0)
			buffer_write(buffer,buffer_u8,NN_MATCH_TIMEUP)
			network_send_packet(client_socket,buffer,buffer_tell(buffer))
		}
	}
}
else alarm[0] = 1
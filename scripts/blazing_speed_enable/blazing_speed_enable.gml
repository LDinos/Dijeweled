function blazing_speed_enable(argument0) {
	var board = argument0

	blazingspeed = true
	audio_play_sound(vo_blazingspeed,0,0)
	audio_play_sound(snd_blazingspeed,0,0)
	if global.online
	{
<<<<<<< HEAD
		with(global.mynet)
		{
			buffer_seek(buffer,buffer_seek_start,0)
			buffer_write(buffer,buffer_u8,NN_MATCH_BLAZING_SPEED_ON)
			network_send_packet(client_socket,buffer,buffer_tell(buffer))
		}
=======
		network_send(NN_MATCH_BLAZING_SPEED_ON)
>>>>>>> 1.9
	}
	with(board)
	{
		alpha = 1
		alarm[2] = 550
	}
	alarm[4] = 600


}

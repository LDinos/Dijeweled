function blazing_speed_enable(argument0) {
	var board = argument0

	blazingspeed = true
	audio_play_sound(vo_blazingspeed,0,0)
	audio_play_sound(snd_blazingspeed,0,0)
	if global.online
	{
		with(global.mynet)
		{
			buffer_seek(buffer,buffer_seek_start,0)
			buffer_write(buffer,buffer_u8,NN_MATCH_BLAZING_SPEED_ON)
			network_send_packet(client_socket,buffer,buffer_tell(buffer))
		}
	}
	with(board)
	{
		alpha = 1
		alarm[2] = 550
	}
	alarm[4] = 600


}

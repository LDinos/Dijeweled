function blazing_speed_enable(argument0) {
	var board = argument0

	blazingspeed = true
	audio_play_sound(vo_blazingspeed,0,0)
	audio_play_sound(snd_blazingspeed,0,0)
	if global.online
	{
		network_send(NN_MATCH_BLAZING_SPEED_ON)
	}
	with(board)
	{
		alpha = 1
		alarm[2] = 550
	}
	alarm[4] = 600


}

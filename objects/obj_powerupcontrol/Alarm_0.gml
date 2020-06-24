/// @description Disable horizontal/vertical only swaps
Gamerule_1.horizontal_swaps_only = false
Gamerule_1.vertical_swaps_only = false
with(global.mynet)
{
	buffer_seek(buffer,buffer_seek_start,0)
	buffer_write(buffer,buffer_u8,NN_MATCH_HORVER_OVER)
	network_send_packet(client_socket,buffer,buffer_tell(buffer))
}
audio_play_sound(snd_chat_msg,0,0)

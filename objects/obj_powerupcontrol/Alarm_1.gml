/// @description Disable inverted swaps
Gamerule_1.inverted_swaps = false
with(global.mynet)
{
	buffer_seek(buffer,buffer_seek_start,0)
	buffer_write(buffer,buffer_u8,NN_MATCH_INVERTED_OVER)
	network_send_packet(client_socket,buffer,buffer_tell(buffer))
}
audio_play_sound(snd_chat_msg,0,0)

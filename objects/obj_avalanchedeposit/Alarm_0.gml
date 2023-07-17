/// @description Game is over, go to menu
room_goto(rm_lobby)
with(global.mynet)
{
	buffer_seek(buffer,buffer_seek_start,0)
	buffer_write(buffer,buffer_u8,NN_BACK_TO_LOBBY)
	network_send_packet(client_socket,buffer,buffer_tell(buffer))
}

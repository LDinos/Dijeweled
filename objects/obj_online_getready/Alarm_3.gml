/// @description Tell server im ready
with(global.mynet)
{
	buffer_seek(buffer,buffer_seek_start,0)
	buffer_write(buffer,buffer_u8,NN_AMREADY)
	network_send_packet(client_socket,buffer,buffer_tell(buffer))
}
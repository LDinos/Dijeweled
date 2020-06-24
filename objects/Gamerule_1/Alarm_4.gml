/// @description kill blazing speed
// You can write your code in this editor
blazingspeedchain = 1
blazingspeed = false
if global.online
{
	with(global.mynet)
	{
		buffer_seek(buffer,buffer_seek_start,0)
		buffer_write(buffer,buffer_u8,NN_MATCH_BLAZING_SPEED_OFF)
		network_send_packet(client_socket,buffer,buffer_tell(buffer))
	}
}

/// @description Insert description here
if global.IAMHOST
{
	with(global.mynet)
		{
			buffer_seek(buffer,buffer_seek_start,0)
			buffer_write(buffer,buffer_u8,NN_LBY_PRESS_CLASSIC)
			network_send_packet(client_socket,buffer,buffer_tell(buffer))
		}
	event_user(0)
}
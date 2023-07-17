/// @description Insert description here
if global.IAMHOST
{
	if (val < valmax)
	{
		val++
	}
	else val = valmin
	with(global.mynet)
	{
		buffer_seek(buffer,buffer_seek_start,0)
		buffer_write(buffer,buffer_u8,NN_LBY_GAMEMODE2)
		buffer_write(buffer,buffer_u8,other.val)
		network_send_packet(client_socket,buffer,buffer_tell(buffer))
	}
}
/// @description Insert description here
if global.IAMHOST
{
enabled = !enabled
image_index = enabled
with(global.mynet)
	{
		buffer_seek(buffer,buffer_seek_start,0)
		buffer_write(buffer,buffer_u8,NN_LBY_DEFENSE)
		buffer_write(buffer,buffer_u8,other.enabled)
		network_send_packet(client_socket,buffer,buffer_tell(buffer))
	}
}
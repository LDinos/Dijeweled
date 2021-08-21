/// @description Insert description here
offset_anim = lerp(offset_anim,offset,0.5)
if (abs(offset) >= offset_max)
{
	gameover = true
	offset = clamp(offset,-offset_max,offset_max)
	Gamerule_1.controlallowed = false
}

if (send_info)
{
	send_info = false
	with(global.mynet)
	{
		buffer_seek(buffer,buffer_seek_start,0)
		buffer_write(buffer,buffer_u8,NN_MATCH_TUG_INFO)
		buffer_write(buffer,buffer_s16,other.offset)
		network_send_packet(client_socket,buffer,buffer_tell(buffer))
	}
}
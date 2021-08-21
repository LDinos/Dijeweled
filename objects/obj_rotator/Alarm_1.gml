/// @description Go to lobby
if global.online
{
	room_goto(rm_lobby)
	with(global.mynet)
	{
		buffer_seek(buffer,buffer_seek_start,0)
		buffer_write(buffer,buffer_u8,NN_BACK_TO_LOBBY)
		network_send_packet(client_socket,buffer,buffer_tell(buffer))
	}
	with(obj_chat)
		{
			chat_write(global.user2 + " is connected.",c_yellow)
		}
}
else room_goto(rm_lobby_local)
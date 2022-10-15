/// @description Go to lobby
if global.online
{
	room_goto(rm_lobby)
	network_send(NN_BACK_TO_LOBBY)
	with(obj_chat)
		{
			chat_write(global.user2 + " is connected.",c_yellow)
		}
}
else room_goto(rm_lobby_local)
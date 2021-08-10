///@param player_index
if argument0 == 0
{
	with(global.mynet)
	{
		buffer_seek(buffer,buffer_seek_start,0)
		buffer_write(buffer,buffer_u8,NN_MATCH_AVALANCHE_MAKE_INVGEMS)
		network_send_packet(client_socket,buffer,buffer_tell(buffer))
	}
	for(var i = 0; i <8; i++)
	{
		for(var j = 0; j<8; j++)
		{
			if Gamerule_1.gemboard[i,j] == -1
			{
				var g = instance_create(Board_1.x + j*64, Board_1.y+i*64,Gem_1)
				with(g)
				{
					set_skin(7)
					amInvisible = true
					scr_add_gemid(Gamerule_1)
				}
			}
		}
	}
}
else
{
	for(var i = 0; i <8; i++)
	{
		for(var j = 0; j<8; j++)
		{
			if !position_meeting(Board_2.x + j*64, Board_2.y+i*64,Gem_2)
			{
				var g = instance_create(Board_2.x + j*64, Board_2.y+i*64,Gem_2)
				with(g)
				{
					set_skin(7)
					amInvisible = true
					//scr_add_gemid(Gamerule_1) | No need, it does it by itself on Gem_2 create event
				}
			}
		}
	}
}
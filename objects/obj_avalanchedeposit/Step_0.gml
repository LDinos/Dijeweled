/// @description Insert description here
x = lerp(x,xdestination,0.1)
if myturn //if it is my turn
{	
	var non_inv_gems = 0;
	with(Gem_1) {if !amInvisible non_inv_gems++}
	gems_existing = hidden_gems + non_inv_gems //non_inv gems einai ta diamantia hdh sto board
	if ammoving //if I made a move, be ready to change turns
	{
		Gamerule_1.controlallowed = false
		if Gamerule_1.IsGemActive2 //everything is stable, now change turn
		{
			if (gems_existing < 64) //normal end turn
			{
				avalanche_end_turn(Board_2,Gem_2)
			}
			else if !gameover //defeat
			{
				gameover = true
				ammoving = false
				if global.IAMHOST alarm[0] = 60*8
				alarm[1] = 60*3
				audio_stop_all()
				audio_play_sound(vo_gameover,0,false)	
				gemdrop(Gem_1)
				with(global.mynet)
				{
					buffer_seek(buffer,buffer_seek_start,0)
					buffer_write(buffer,buffer_u8,NN_MATCH_AVALANCHE_GAMEOVER)
					network_send_packet(client_socket,buffer,buffer_tell(buffer))
				}
			}
		}
	}
}
else
{
	spawn_invs = false
	var non_inv_gems = 0;
	with(Gem_2) {if !amInvisible non_inv_gems++}
	gems_existing = hidden_gems + non_inv_gems
	if doonce
	{
		if Gamerule_1.IsGemActive
		{
			doonce = false
			/*with(Gem_1) {if amInvisible instance_destroy()}
			with(global.mynet)
			{
				buffer_seek(buffer,buffer_seek_start,0)
				buffer_write(buffer,buffer_u8,NN_MATCH_AVALANCHE_DESTROY_INVGEMS)
				network_send_packet(client_socket,buffer,buffer_tell(buffer))
			}*/
		}
	}
}
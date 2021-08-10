function powerup_three_flames() {
	var IDs = -1
	var n = 0
	if instance_number(Gem_1) > 10
	{
		repeat(3)
		{
			do
			{
				var done = false
				var i = irandom(7)
				var j = irandom(7)
				if Gamerule_1.gem_board1[i,j] != noone
				{
					if (Gamerule_1.gem_board1[i,j].gempower = 0) && (Gamerule_1.gem_board1[i,j].mypowerup == -1)
					{
						audio_play_sound(snd_flamecreate,0,false)
						instance_create(Gamerule_1.gem_board1[i,j].x,Gamerule_1.gem_board1[i,j].y,obj_coalify)
						Gamerule_1.gem_board1[i,j].gempower = 1
						IDs[n] = Gamerule_1.gem_board1[i,j].myid
						n++
						done = true
					}
				}
			}
			until done
		}
	}

	with(global.mynet)
	{
		buffer_seek(buffer,buffer_seek_start,0)
		buffer_write(buffer,buffer_u8,NN_MATCH_POWERUP_TRIGGER)
		//buffer_write(buffer,buffer_u8,6) //powerup
		buffer_write(buffer,buffer_u8,IDs[0])
		buffer_write(buffer,buffer_u8,IDs[1])
		buffer_write(buffer,buffer_u8,IDs[2])
		network_send_packet(client_socket,buffer,buffer_tell(buffer))
	}


}

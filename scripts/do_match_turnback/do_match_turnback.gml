///do_match(GAMERULE_INDEX)
function do_match_turnback(argument0) {
	// @param Gamerule
	//Do the match animation (again but in reverse), and set that gamerule to gemactive0
	Gamerule_1.replay_illegals_allowed = false
	if argument0 = Gamerule_1 myid = Gem_1
	else if argument0 = Gamerule_local myid = Gem_local
	else myid = Gem_2
	if global.online
		{
			var idtosend1 = gemtomove1.myid
			var idtosend2 = gemtomove2.myid
<<<<<<< HEAD
			with(global.mynet)
			{
				buffer_seek(buffer,buffer_seek_start,0)
				buffer_write(buffer,buffer_u8,NN_MATCH_GEM_SWAP)
				buffer_write(buffer,buffer_u8,idtosend1)
				buffer_write(buffer,buffer_u8,idtosend2)
				network_send_packet(client_socket,buffer,buffer_tell(buffer))
			}
=======
			network_send(NN_MATCH_GEM_SWAP, [buffer_u8, buffer_u8], [idtosend1, idtosend2])
>>>>>>> 1.9
		}
	ammoving = true
	with(gemtomove1)
	{
		myfriend = collision_point(x,y-64,other.myid,false,true)
		with(myfriend) matchnear = true
	}
	with(gemtomove2)
	{
		myfriend = collision_point(x,y-64,other.myid,false,true)
		with(myfriend) matchnear = true
	}
	//with(gemtomove1) ammoving = true
	//with(gemtomove1) ammoving = true
	percent = 0
	xx = gemtomove1.x
	yy = gemtomove1.y
	xx2 = gemtomove2.x
	yy2 = gemtomove2.y
	with(gemtomove1) {isturnback = true; ammoving = true; SWAP_X_END = other.gemtomove2.x - x; SWAP_Y_END = other.gemtomove2.y - y; alarm[5] = 1}
	with(gemtomove2) {isturnback = true; ammoving = true; SWAP_X_END = other.gemtomove1.x - x; SWAP_Y_END = other.gemtomove1.y - y; alarm[5] = 1}
	//alarm[3] = 1



}

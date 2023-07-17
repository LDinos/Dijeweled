function avalanche_end_turn(argument0, argument1) {
	var board = argument0
	var gem = argument1
	make_avalanche_compliment()
	if !global.online
	{

		myturn = !myturn //change turns
		if myturn //if I am now player 1
		{
			with(spawner_avalanche) event_user(0) //spawn gems
			Gamerule_1.controlallowed = true
			Gamerule_1.IsGemActive = 0
			Gamerule_1.IsGemActive2 = 0
		}
<<<<<<< HEAD
		else //if I am not player 2
=======
		else //if I am now player 2
>>>>>>> 1.9
		{
			Gamerule_local.controlallowed = true
			Gamerule_local.IsGemActive = 0
			Gamerule_local.IsGemActive2 = 0
			with(spawner_avalanche_local) event_user(0) //spawn gems
		}

	}
	else myturn = false
	gemsmatched = 0
	num_turns++
	ammoving = false
	xdestination = board.x - 32 + sprite_width/2
<<<<<<< HEAD
	with(global.mynet)
	{
		buffer_seek(buffer,buffer_seek_start,0)
		buffer_write(buffer,buffer_u8,NN_MATCH_AVALANCHE_END_TURN)
		buffer_write(buffer,buffer_u8,other.gems_to_send) //make pass2 sound effect?
		network_send_packet(client_socket,buffer,buffer_tell(buffer))
=======
	network_send(NN_MATCH_AVALANCHE_END_TURN, [buffer_u8], [gems_to_send])	

	if global.online
	{
		var non_inv_gems = 0;
		with(gem) {if !amInvisible non_inv_gems++}

		hidden_gems = gems_to_send + non_inv_gems - 64
		if hidden_gems < 0 hidden_gems = 0
		gems_existing = hidden_gems + non_inv_gems
>>>>>>> 1.9
	}
	gems_to_send = 1

<<<<<<< HEAD
	if global.online
	{
		var non_inv_gems = 0;
		with(gem) {if !amInvisible non_inv_gems++}

		hidden_gems = gems_to_send + non_inv_gems - 64
		if hidden_gems < 0 hidden_gems = 0
		gems_existing = hidden_gems + non_inv_gems
	}
	gems_to_send = 1




=======



>>>>>>> 1.9
}

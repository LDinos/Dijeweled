/// @description Board Spawn
randomize()
var seed = random_get_seed()
if global.IAMHOST
{
	with(global.mynet)
	{
		buffer_seek(buffer,buffer_seek_start,0)
		buffer_write(buffer,buffer_u8,NN_MATCH_BOARD_SPAWN)
		buffer_write(buffer,buffer_u32,seed)
		network_send_packet(client_socket,buffer,buffer_tell(buffer))
	}
	
	if (global.SET_gamemode == 1) 
	{
		Gamerule_1.IsGemActive = 0
		Gamerule_1.IsGemActive2 = 0
		Gamerule_1.controlallowed = true
		audio_play_sound(vo_go,0,false)
		instance_create(0,0,spawner_avalanche)
		instance_create(room_width/2,992,obj_avalanche_pass)
		with(spawner_avalanche) event_user(1)
		with(obj_avalanchedeposit) doonce = !doonce
		with(global.mynet)
		{
			buffer_seek(buffer,buffer_seek_start,0)
			buffer_write(buffer,buffer_u8,NN_MATCH_GO)
			network_send_packet(client_socket,buffer,buffer_tell(buffer))
		}
		instance_destroy()
	}
	else
	{
		instance_create(0,0,spawner1)
		with(spawner1) event_user(1)
	}
	Gamerule_1.ONLINE_give_gem_id = true //from now on, each gem spawn will give an id in its create event.
										 //while before we didn't need the gems to give info, as they would spawn just like our board (same).
}

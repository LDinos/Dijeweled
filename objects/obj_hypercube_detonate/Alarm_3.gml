/// @description Insert description here
if instance_number(obj_hypercube_detonate) <= 1 //only me exists
{
	Gamerule_1.moving = false
	Gamerule_1.hypeOn = false
	with(Gamerule_1) {
		recheck_gem_readiness(Gem_1)
		must_spawn_gems = true
	}
	with(global.mynet)
	{
		buffer_seek(buffer,buffer_seek_start,0)
		buffer_write(buffer,buffer_u8,NN_MATCH_HYPE_OFF)
		network_send_packet(client_socket,buffer,buffer_tell(buffer))
	}
	with(global.mynet)
	{
		buffer_seek(buffer,buffer_seek_start,0)
		buffer_write(buffer,buffer_u8,NN_MATCH_SEND_POINTS)
		buffer_write(buffer,buffer_u32,Gamerule_1.points)
		buffer_write(buffer,buffer_u32,Gamerule_1.style)
		network_send_packet(client_socket,buffer,buffer_tell(buffer))
	}
}
instance_destroy()
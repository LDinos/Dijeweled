/// @description instance_destroy();
/// @function instance_destroy
with(Gem_1) acc = 0
//if octa {}
instance_destroy();
if !instance_exists(lightningObj1)
{
	with(global.mynet)
	{
		buffer_seek(buffer,buffer_seek_start,0)
		buffer_write(buffer,buffer_u8,NN_MATCH_SEND_POINTS)
		buffer_write(buffer,buffer_u32,Gamerule_1.points)
		buffer_write(buffer,buffer_u32,Gamerule_1.style)
		network_send_packet(client_socket,buffer,buffer_tell(buffer))
	}
	Gamerule_1.lightOn = false //no longer producing lightning, now the gems can move :)
	Gamerule_1.octanovaOn = false
}



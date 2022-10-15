/// @description instance_destroy();
/// @function instance_destroy
with(Gem_1) acc = 0
//if octa {}
instance_destroy();
if !instance_exists(lightningObj1)
{
	network_send(NN_MATCH_SEND_POINTS, [buffer_u32,buffer_u32], [Gamerule_1.points,Gamerule_1.style])
	Gamerule_1.lightOn = false //no longer producing lightning, now the gems can move :)
	Gamerule_1.octanovaOn = false
}



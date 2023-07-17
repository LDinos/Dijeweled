/// @description Insert description here
if instance_number(obj_hypercube_detonate) <= 1 //only me exists
{
	Gamerule_1.moving = false
	Gamerule_1.hypeOn = false
	network_send(NN_MATCH_HYPE_OFF)
	network_send(NN_MATCH_SEND_POINTS, [buffer_u32, buffer_u32], [Gamerule_1.points, Gamerule_1.style])
}
instance_destroy()
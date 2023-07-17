/// @description Insert description here
if global.IAMHOST
{
	if (val < valmax)
	{
		val++
	}
	else val = valmin
	
	network_send(NN_LBY_GAMEMODE, [buffer_u8], [val])	
	
	if val = 0 && !instance_exists(LOB_gamemode_2) 
	{
		instance_destroy(LOB_gamemode_defence); 
		instance_create(168,336,LOB_gamemode_2)
	}
	else if val = 1 && !instance_exists(LOB_gamemode_defence) 
	{
		instance_destroy(LOB_gamemode_2); 
		instance_create(16,336,LOB_gamemode_defence)
	}
	else {instance_destroy(LOB_gamemode_defence); instance_destroy(LOB_gamemode_2);}
}
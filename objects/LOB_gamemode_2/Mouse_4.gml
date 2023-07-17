/// @description Insert description here
if global.IAMHOST
{
	if (val < valmax)
	{
		val++
	}
	else val = valmin
	
	network_send(NN_LBY_GAMEMODE2, [buffer_u8], [val])
}
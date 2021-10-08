global.online = true
if !global.IAMHOST
{
	with(global.mynet)
	{
		buffer_seek(buffer,buffer_seek_start,0)
		buffer_write(buffer,buffer_u8,NN_LBY_REQUEST_SETTINGS)
		network_send_packet(client_socket,buffer,buffer_tell(buffer))
	}

}
else
{
	LOB_multiswap.enabled = global.SET_multiswap
	LOB_multiswap.image_index = LOB_multiswap.enabled
	LOB_hypercubes.enabled = global.SET_hyper
	LOB_hypercubes.image_index = LOB_hypercubes.enabled
	LOB_matchless.enabled = global.SET_matchless
	LOB_matchless.image_index = LOB_matchless.enabled
	LOB_twist.enabled = global.SET_twist 
	LOB_twist.image_index = LOB_twist.enabled
	LOB_skins.val = global.SET_skin
	LOB_gamemode.val = global.SET_gamemode
	LOB_ultranovas.enabled = global.SET_ultranovas
	LOB_ultranovas.image_index = LOB_ultranovas.enabled
	if (LOB_gamemode.val = 0) LOB_gamemode_2.val = global.SET_gamemode2 
	else if (LOB_gamemode.val = 1)
	{
		instance_destroy(LOB_gamemode_2); 
		var g = instance_create(16,336,LOB_gamemode_defence); 
		g.enabled = global.SET_gamemode2
		g.image_index = LOB_gamemode_defence.enabled
	}
}
global.online = true

if global.IAMHOST
{

	if (LOB_gamemode.val = 0) LOB_gamemode_2.val = global.SET_gamemode2 
	else if (LOB_gamemode.val = 1)
	{
		instance_destroy(LOB_gamemode_2); 
		var g = instance_create(16,336,LOB_gamemode_defence); 
		g.enabled = global.SET_gamemode2
		g.image_index = LOB_gamemode_defence.enabled
	}
}
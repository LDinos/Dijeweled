/// @description Insert description here
if global.canbepressed
{
	// check if servers are alive
	cl = instance_create(0,0,obj_tfj_client)
	if (cl.connection<0) 
	{
		instance_destroy(obj_tfj_client)
	}
	else
	{
		global.canbepressed = false
		with(obj_menu_buttons_master)
		{
			kill_current_group()
			change_to_group("tfjeweled")
		}
	}
}

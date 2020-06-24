/// @description Insert description here
if global.canbepressed
{
	if !global.debug
	{
	instance_destroy(obj_button_multiplayer)
	instance_destroy(obj_button_singleplayer)
	//instance_destroy(obj_button_back)
	instance_destroy()
	
	instance_create(xx,y+sprite_height+32,obj_button_host)
	instance_create(xx,y,obj_button_join)
	//instance_create(xx,y+ sprite_height*5 +32*5,obj_button_back)
	}
	else
	{
		error = true
		alarm[2] = 60*3
	}
}
/// @description Insert description here
if global.canbepressed
{
	with(obj_button_play) instance_destroy()
	with(obj_button_options) instance_destroy()
	with(obj_button_help) instance_destroy()
	with(obj_button_quit) instance_destroy()
	with(obj_button_credits) instance_destroy()
	instance_create(xx,y+ sprite_height*3 +32*3,obj_button_back)
	instance_create(0,0,obj_replaylist)
	mouse_clear(mb_any);
	instance_destroy()
}
global.canbepressed = false
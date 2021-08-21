/// @description Insert description here
if global.canbepressed
{
	instance_destroy(obj_button_multiplayer)
	instance_destroy(obj_button_online)
	instance_destroy(obj_button_back)
	instance_destroy()
	
	instance_create(xx,y-sprite_height-32,obj_button_secret)
	instance_create(xx,y,obj_button_arcade)
	instance_create(xx,y+sprite_height+32,obj_button_blitz)
	instance_create(xx,y+ sprite_height*2 + 32*2,obj_button_classic)
	instance_create(xx,y+ sprite_height*3 +32*3,obj_button_challenge)
	instance_create(xx,y+ sprite_height*4 +32*4,obj_button_zen)
	instance_create(xx,y+ sprite_height*5 +32*5,obj_button_back)
}
global.canbepressed = false
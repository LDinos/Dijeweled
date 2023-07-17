/// @description Insert description here
if global.canbepressed
{
	alarm[1] = 1
	with(obj_button_options) alarm[1] = 5
	with(obj_button_replays) alarm[1] = 10
	with(obj_button_help) alarm[1] = 10
	with(obj_button_quit) instance_destroy()
	with(obj_button_credits) alarm[1] = 10
	instance_create(xx,y,obj_button_singleplayer)	
	instance_create(xx,y+sprite_height+32,obj_button_multiplayer)
	instance_create(xx,y+sprite_height*2+32*2,obj_button_online)
	//instance_create(xx,y+sprite_height+32,obj_button_multiplayer)
	//instance_create(xx,y+ sprite_height*2 + 32*2,obj_button_online)
	/*
	instance_create(xx,y-sprite_height-32,obj_button_secret)
	instance_create(xx,y,obj_button_arcade)
	instance_create(xx,y+sprite_height+32,obj_button_blitz)
	instance_create(xx,y+ sprite_height*2 + 32*2,obj_button_classic)
	instance_create(xx,y+ sprite_height*3 +32*3,obj_button_challenge)
	instance_create(xx,y+ sprite_height*4 +32*4,obj_button_zen)*/
	instance_create(xx,y+ sprite_height*5 +32*5,obj_button_back)
}
global.canbepressed = false
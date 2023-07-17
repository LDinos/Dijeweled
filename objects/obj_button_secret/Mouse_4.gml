/// @description Insert description here
if global.canbepressed
{
<<<<<<< HEAD
	instance_destroy()
	with(obj_button_arcade) instance_destroy()
	with(obj_button_blitz) instance_destroy()
	with(obj_button_challenge) instance_destroy()
	with(obj_button_zen) instance_destroy()
	with(obj_button_classic) instance_destroy()
	
	//instance_create(xx,y-sprite_height-32,obj_button_secret)
	//instance_create(xx,y,obj_button_arcade)
	
	instance_create(xx,y,obj_button_countdown)
	instance_create(xx+sprite_width,y,obj_button_insanity)
	instance_create(xx,y+sprite_height+32,obj_button_twist)
	instance_create(xx,y+ sprite_height*2 + 32*2,obj_button_compact)
	instance_create(xx,y+ sprite_height*3 +32*3,obj_button_swift)
	instance_create(xx,y+ sprite_height*4 +32*4,obj_button_survivor)
	instance_create(xx,y+ sprite_height*5 +32*5,obj_button_buyo)
	//instance_create(xx,y+ sprite_height*5 +32*5,obj_button_back)
=======
	with(obj_menu_buttons_master) {
		kill_current_group()
		change_to_group("secret")
	}
>>>>>>> 1.9
}

/// @description Insert description here
if global.canbepressed
{
	global.canbepressed = false
	if !file_exists("autosave_rm_classic")
	{
		var fade = instance_create(0,0,obj_black_fade)
		with(fade) room_to_go = rm_classic
	}
	else
	{
		global.goto = rm_classic
		instance_create(256+128,room_height/2 - sprite_height,obj_neworcontinue)
	}
}

/// @description Insert description here
if global.canbepressed
{
	global.canbepressed = false
	if !file_exists("autosave_rm_timeattack")
	{
		fade_to_room(rm_timeattack)
	}
	else
	{
		global.goto = rm_timeattack
		instance_create(256+128,room_height/2 - sprite_height,obj_neworcontinue)
	}
}

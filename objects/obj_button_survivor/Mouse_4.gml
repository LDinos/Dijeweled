/// @description Insert description here
if global.canbepressed && unlocked
{
	global.canbepressed = false
	if !file_exists("autosave_rm_survivor")
	{
		fade_to_room(rm_survivor)
	}
	else
	{
		global.goto = rm_survivor
		instance_create(256+128,room_height/2 - sprite_height,obj_neworcontinue)
	}
}

/// @description Insert description here
// You can write your code in this editor
if global.canbepressed
{
	//global.replay_match_allowed = true
	/*global.canbepressed = false
	var fade = instance_create(0,0,obj_black_fade)
	with(fade) room_to_go = rm_blitz_matchreplay
	global.timer = 180
	global.replay_string = "rep19-9-2018.rep"*/
	
	/*
	with(obj_button_classic) instance_destroy()
	with(obj_button_blitz) instance_destroy()
	with(obj_button_challenge) instance_destroy()
	with(obj_button_arcade) instance_destroy()
	instance_create(0,0,obj_replaylist)
	mouse_clear(mb_any);
	instance_destroy()*/
	
	global.canbepressed = false
	if !file_exists("autosave_rm_zen")
	{
		var fade = instance_create(0,0,obj_black_fade)
		with(fade) room_to_go = rm_zen
	}
	else
	{
		global.goto = rm_zen
		instance_create(256+128,room_height/2 - sprite_height,obj_neworcontinue)
	}
}
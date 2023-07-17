/// @description Insert description here
if global.canbepressed
{
	//global.replay_match_allowed = true
	global.canbepressed = false
	//var fade = instance_create(0,0,obj_black_fade)
	//with(fade) room_to_go = rm_blitz	
	with(obj_button_arcade) alarm[1] = 5
	alarm[3] = 10
	with(obj_button_classic) alarm[1] = 15
	with(obj_button_challenge) alarm[1] = 10
	with(obj_button_zen) alarm[1] = 5
	with(obj_button_secret) alarm[1] = 1
	alarm[1] = 1
	instance_create(xx,y,obj_button_1min)
	instance_create(xx,y+sprite_height+32,obj_button_3min)
	instance_create(xx,y+ sprite_height*2 + 32*2,obj_button_5min)
	instance_create(x,y+ sprite_height*3 + 32*3,obj_pause_tick_replaymatch)

}
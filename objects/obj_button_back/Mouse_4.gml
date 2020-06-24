/// @description Insert description here
if global.canbepressed
{
	if room != rm_menu_challenges
	{
	alarm[1] = 1
	with(obj_button_zen) alarm[1] = 5
	with(obj_button_challenge) alarm[1] = 9
	with(obj_button_classic) alarm[1] = 5
	with(obj_button_blitz) alarm[1] = 3
	with(obj_button_arcade) alarm[1] = 1
	
	with(obj_button_singleplayer) instance_destroy()
	with(obj_button_multiplayer) instance_destroy()
	with(obj_button_online) instance_destroy()
	
	with(obj_button_host) instance_destroy()
	with(obj_button_join) instance_destroy()
	
	with(obj_button_compact) instance_destroy()
	with(obj_button_swift) instance_destroy()
	with(obj_button_twist) instance_destroy()
	with(obj_button_survivor) instance_destroy()
	with(obj_button_buyo) instance_destroy()
	with(obj_button_countdown) instance_destroy()
	with(obj_button_secret) alarm[1] = 1
	
	with(obj_button_1min) alarm[1] = 5
	with(obj_button_3min) alarm[1] = 10
	with(obj_button_5min) alarm[1] = 5
	with(obj_pause_tick_replaymatch) instance_destroy()
	with(obj_replaylist) instance_destroy()
	global.replay_match_allowed = false
	
	with(obj_challenges_room) instance_destroy()
	with(obj_challenges_selection) instance_destroy()
	
	instance_create(xx,y,obj_button_quit)
	instance_create(xx,y - sprite_height*1 - 32*1,obj_button_credits)
	instance_create(xx,y - sprite_height*2 - 32*2,obj_button_help)
	instance_create(xx,y - sprite_height*3 - 32*3,obj_button_replays)
	instance_create(xx,y - sprite_height*4 - 32*4,obj_button_options)
	instance_create(xx,y - sprite_height*5 - 32*5,obj_button_play)
	global.canbepressed = false
	}
	else room_goto(rm_menu)
}
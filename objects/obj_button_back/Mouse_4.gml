/// @description Insert description here
if global.canbepressed {
	if room != rm_menu_challenges {
		with(obj_menu_buttons_master) {
			kill_current_group()
			if (current_group == global.button_group[$ "play"] || current_group == global.button_group[$ "replays"]) {
				change_to_group("initial")
			}
			else if (current_group == global.button_group[$ "single"] || current_group == global.button_group[$ "online"]) {
				change_to_group("play")
			}
			else if (current_group == global.button_group[$ "blitz"] || current_group == global.button_group[$ "secret"]) {
				change_to_group("single")
			}
		}
	
<<<<<<< HEAD
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
	with(obj_button_insanity) instance_destroy()
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
=======
		with(obj_pause_tick_replaymatch) instance_destroy()
		with(obj_replaylist) instance_destroy()
		global.replay_match_allowed = false
		with(obj_button_online_replays) instance_destroy()
		with(obj_challenges_room) instance_destroy()
		with(obj_challenges_selection) instance_destroy()
>>>>>>> 1.9
	}
	else room_goto(rm_menu)
}
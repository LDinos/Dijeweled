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
	
		with(obj_pause_tick_replaymatch) instance_destroy()
		with(obj_replaylist) instance_destroy()
		global.replay_match_allowed = false
	
		with(obj_challenges_room) instance_destroy()
		with(obj_challenges_selection) instance_destroy()
	}
	else room_goto(rm_menu)
}
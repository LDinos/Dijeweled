/// @description Deploy button groups
function kill_current_group(instant = false) {
	for(var i = 0; i < array_length(current_group); i++) {
		with(current_group[i]) {
			if (instant) instance_destroy()
			else alarm[1] = 1 + i*4
		}
	}
}

//Makes a transition from current buttons group to the new one
function change_to_group(group) {
	global.canbepressed = false
	current_group = global.button_group[$ group]
	for(var i = 0; i < array_length(current_group); i++) {
		var button_id = current_group[i]
		if (button_id != noone) {
			var b = instance_create(-196, 32 + 96*i, button_id)
			with(b) {
				alarm[0] = 1 + i*4
				alarm[1] = 0
			}
			alarm[0] = 20 + i*4 //allow button pressing after a bit
		}
	}
}

global.button_group = {
	"initial" : [noone, obj_button_play, obj_button_options, obj_button_replays, 
				obj_button_help, obj_button_credits, obj_button_quit],
	"play" : [noone, obj_button_singleplayer, obj_button_multiplayer, obj_button_online, noone,
				noone, obj_button_back],
	"single" : [obj_button_secret, obj_button_arcade, obj_button_blitz,
				obj_button_classic, obj_button_challenge, obj_button_zen, obj_button_back],
	"blitz" : [noone, noone, obj_button_1min,
				obj_button_3min, obj_button_5min, obj_pause_tick_replaymatch, obj_button_back],
	"secret" : [obj_button_countdown, obj_button_twist, obj_button_compact,
				obj_button_swift, obj_button_survivor, obj_button_buyo, obj_button_back],
	"online" : [noone, noone, noone, obj_button_join, obj_button_host, noone, obj_button_back],
	"replays" : [noone, noone, noone, noone, noone, noone, obj_button_back]
}

change_to_group("initial")


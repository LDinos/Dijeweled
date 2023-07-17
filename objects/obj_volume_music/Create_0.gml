/// @description Insert description here
depth = -100
amclicked = false
gamepad_selected = false
hover = false

function gamepad_move_slider(dir) {
	global.VolMus = clamp(global.VolMus+0.05*dir, 0, 1) 
	audio_group_set_gain(audiogroup_music,global.VolMus,0)
}
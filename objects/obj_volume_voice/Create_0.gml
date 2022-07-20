/// @description Insert description here
depth = -100
amclicked = false
gamepad_selected = false
hover = false

function gamepad_move_slider(dir) {
	global.VolVO = clamp(global.VolVO+0.05*dir,0,1)
	audio_group_set_gain(audiogroup_music,global.VolVO,0)
}
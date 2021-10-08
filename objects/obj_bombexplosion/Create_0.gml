/// @description Insert description here
// You can write your code in this editor
audio_group_stop_all(audiogroup_music)
instance_create(x,y,obj_bombring)
if !audio_is_playing(vo_gameover) audio_play_sound(vo_gameover,0,false)
image_speed = 0
depth = -11
image_xscale = .5
image_yscale = .5
func = 0
alarm[0] = 1
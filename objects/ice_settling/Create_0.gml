/// @description Insert description here
image_speed = 0
alarm[0] = 15
depth = -10
mygem = instance_position(x,y,Gem_1)
ds_list_add(Gamerule_1.list_of_ice_locks,mygem)
audio_play_sound(snd_lock_start,0,0)
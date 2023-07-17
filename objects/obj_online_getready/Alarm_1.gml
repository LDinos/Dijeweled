/// @description GO
audio_play_sound(vo_go,0,false)
with(obj_glassbar) ready = true


with(obj_rotator) alarm[0] = 60
Gamerule_1.controlallowed = true
network_send(NN_MATCH_GO)
visible = false
if global.SET_gamemode = 0 alarm[2] = 60
else instance_destroy()
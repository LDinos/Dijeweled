/// @description GO
audio_play_sound(vo_go,0,false)
with(obj_glassbar) ready = true


with(obj_rotator) alarm[0] = 60
Gamerule_local.controlallowed = true
Gamerule_1.controlallowed = true
network_send(NN_MATCH_GO)
with(global.mynet)
	{
		buffer_seek(buffer,buffer_seek_start,0)
		buffer_write(buffer,buffer_u8,NN_MATCH_GO)
		network_send_packet(client_socket,buffer,buffer_tell(buffer))
	}
visible = false
if global.SET_gamemode = 0 alarm[2] = 60
else instance_destroy()
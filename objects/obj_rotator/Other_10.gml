/// @description Insert description here
done++
if (done == 2)
{
	alarm[2] = 3*60
	if global.IAMHOST
	{
		network_send(NN_SERVER_REPLAY_STOP)
		alarm[1] = 8*60	
	}	
}

if (done == 2) {
	audio_play_sound(vo_gameover,0,false)
	if (global.SET_skin == 7) && (!global.spectator) instance_create(x,y,obj_uploadstats) //only for 7 skins we upload stats
}

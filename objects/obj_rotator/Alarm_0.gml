/// @description Insert description here
global.timer--
if global.timer > 0
{
	if global.timer == 60*4
	{
		with(obj_pipes) event_user(0)
	}
	else if global.timer == 60*3
	{
		with(obj_pipes) event_user(0)
	}
	else if global.timer == 60*2
	{
		with(obj_pipes) event_user(0)
	}
	else if global.timer == 60
	{
		with(obj_pipes) event_user(0)
	}
	else if global.timer == 30
	{
		audio_play_sound(vo_30secs,0,false)
	}
	
	if global.timer <= 10
	{
		var str = "vo_" + string(global.timer)
		var snd = asset_get_index(str)
		audio_play_sound(snd,0,false)
	}
	alarm[0] = 60
}
else 
{
	audio_play_sound(vo_timeup,0,false)
	if (!global.spectator) {
		Gamerule_1.controlallowed = false; 
		if !global.online {Gamerule_local.controlallowed = false; instance_create(x,y,obj_lasthur_local)}
		instance_create(x,y,obj_lasthur_online)
	}
	
}
/// @description A small delay for the boards to spawn
if !global.IAMHOST alarm[3] = 60 //in case of first time lag, make sure level is loaded
x = room_width/2
y = room_height - 720/2
depth = -1000
if global.SET_gamemode = 0
{
	if global.SET_gamemode2 = 0 global.timer = 300
			else if global.SET_gamemode2 = 1 global.timer = 180
			else global.timer = 60
	deftime = global.timer 
	audio_play_sound(vo_getready,0,false)
	alarm[0] = 90
	//if global.IAMHOST alarm[1] = 60*8
	
}
/*else if global.SET_gamemode = 1 alarm[0] = 60*3
else
{
	audio_play_sound(vo_getready,0,false)
	alarm[0] = 90
	//if global.IAMHOST alarm[1] = 60*8
}*/

function other_player_is_now_ready() { //for server only
	if (global.SET_gamemode == 0) alarm[1] = 60*8
	else alarm[0] = 60*3
}
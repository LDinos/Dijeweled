/// @description Insert description here
if global.canbepressed
{
	global.timer = 60
	global.canbepressed = false
	var fade = instance_create(0,0,obj_black_fade)
	with(fade) room_to_go = rm_blitz
}
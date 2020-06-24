/// @description Insert description here
//audio_play_sound(snd_magicword,0,0)

if global.canbepressed
{
	global.canbepressed = false
	with(obj_button_classic) instance_destroy()
	with(obj_button_blitz) instance_destroy()
	with(obj_button_zen) instance_destroy()
	with(obj_button_arcade) instance_destroy()
	//instance_create(0,0,obj_challenges_room)
	mouse_clear(mb_any);
	room_goto(rm_menu_challenges)
	instance_destroy()
}
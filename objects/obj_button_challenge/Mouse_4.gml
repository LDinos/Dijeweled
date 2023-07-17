/// @description Insert description here
//audio_play_sound(snd_magicword,0,0)
if global.canbepressed
{
	global.canbepressed = false
	mouse_clear(mb_any);
	fade_to_room(rm_menu_challenges)
}
/// @description Insert description here
if global.canbepressed
{
	with(obj_menu_buttons_master) {
		kill_current_group(true)
		change_to_group("replays")
	}
	instance_create(0,0,obj_replaylist)
	mouse_clear(mb_any);
}
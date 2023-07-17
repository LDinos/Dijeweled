/// @description Insert description here
if global.canbepressed
{
	global.replay_match_allowed = true
	with(obj_menu_buttons_master) {
		kill_current_group()
		change_to_group("blitz")
	}
}
/// @description Insert description here
if global.canbepressed
{
	with(obj_menu_buttons_master) {
		kill_current_group()
		change_to_group("single")
	}
}
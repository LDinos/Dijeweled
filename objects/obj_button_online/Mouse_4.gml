/// @description Insert description here
if global.canbepressed
{
	if !global.debug
	{
		with(obj_menu_buttons_master) {
			kill_current_group()
			change_to_group("online")
		}
	}
	else
	{
		error = true
		alarm[2] = 60*3
	}
}
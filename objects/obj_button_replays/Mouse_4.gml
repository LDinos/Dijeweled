/// @description Insert description here
if global.canbepressed
{
	with(obj_menu_buttons_master) {
		kill_current_group(true)
		change_to_group("replays")
	}
	instance_create(0,0,obj_replaylist)
	with(obj_button_online_replays) {x = 192+32; y = room_height - 96-16}
	//instance_create(192+32,room_height - 96-16,obj_button_online_replays)
	mouse_clear(mb_any);
}
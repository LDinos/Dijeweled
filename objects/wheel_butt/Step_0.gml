if instance_exists(wheel_spinner)
{
    x = wheel_spinner.x
    y = wheel_spinner.y
}
else instance_destroy()


if !Gamerule_1.isReplay
{
	if mouse_check_button_pressed(mb_left) || gamepad_button_check_pressed(global.gp[0],gp_face1)
	{
		if amready = 1 && instance_position(mouse_x,mouse_y,id) != noone event_user(0)
	}
}
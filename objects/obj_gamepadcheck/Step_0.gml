if keyboard_check_pressed(vk_escape) || keyboard_check_pressed(vk_backspace) || gamepad_button_check_pressed(global.gp[0],gp_start)
{
	toggle_pause()
}
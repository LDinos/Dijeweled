/// @description MOVE
if keyboard_check(vk_left) || keyboard_check(vk_right) || gamepad_button_check(global.gp[0],gp_padl) || gamepad_button_check(global.gp[0],gp_padr) 
{
	if keyboard_check(vk_left) || gamepad_button_check(global.gp[0],gp_padl) left = true
	else left = false
	event_user(1)
	alarm[1] = 5
}
else alarm[1] = -1
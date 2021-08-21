/// @description Insert description here
#region keyboard/gamepad
	var pres = false
	if keyboard_check(vk_right) || gamepad_button_check(global.gp[0],gp_padr) {if pos_j < 6 pos_j++; keyboard_control = true; pres = true}
	if keyboard_check(vk_left) || gamepad_button_check(global.gp[0],gp_padl) {if pos_j > 0 pos_j--;keyboard_control = true; pres = true}
	if keyboard_check(vk_down) || gamepad_button_check(global.gp[0],gp_padd){if pos_i < 6 pos_i++;keyboard_control = true; pres = true}
	if keyboard_check(vk_up) || gamepad_button_check(global.gp[0],gp_padu) {if pos_i > 0 pos_i--;keyboard_control = true; pres = true}
	if pres	{alarm[0] = holdbutton; holdbutton = 5}
	else alarm[0] = -1
#endregion
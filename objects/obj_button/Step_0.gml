/// @description
hover = false;
if mouse_over(x, y, x+button_width, y+button_height) {
	hover = true
	if mouse_check_button_pressed(mb_left) click()
}
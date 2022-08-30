/// @description
if mouse_over(x-box_width/2, y, x+box_width/2,y+box_height) {
	hover = true
	if mouse_check_button_pressed(mb_left) {
		click()
	}
}
else hover = false


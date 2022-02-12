//Q: Why do we check for finger changes instead of just a tap (=mouse_press)?
//A: Because sometimes phones dont take finger touches as taps but as dragging instead, 
//which would not give input most of the times
var fingermoved = false
if (prev_mousex != mouse_x || prev_mousey != mouse_y) fingermoved = true
prev_mousex = mouse_x
prev_mousey = mouse_y
if fingermoved || (mouse_check_button(mb_left) && !fingermoved) {
	if mouse_over(buttons1_x_start, y, buttons1_x_start+button_width, y+button_height) {
		with(obj_buyo_control) mobile_rot_left = true
	} else with(obj_buyo_control) mobile_rot_left = false
	
	if mouse_over(buttons1_x_start+button_width, y, buttons1_x_start+(button_width*2), y+button_height) {
		with(obj_buyo_control) mobile_rot_right = true
	} else with(obj_buyo_control) mobile_rot_right = false
	
	if mouse_over(buttons2_x_start, y, buttons2_x_start+button_width, y+button_height) {
		with(obj_buyo_control) mobile_left = true
	} else with(obj_buyo_control) mobile_left = false
	
	if mouse_over(buttons2_x_start, y, buttons2_x_start+(button_width*2), y+button_height) {
		with(obj_buyo_control) mobile_right = true
	} else with(obj_buyo_control) mobile_right = false
	
	if mouse_over(buttons1_x_start, y-sprite_height, buttons1_x_start+(button_width*2), y-1) {
		with(obj_buyo_control) mobile_down = true
	} else with(obj_buyo_control) mobile_down = false
	
}
else {
	with(obj_buyo_control) {
		mobile_rot_left = false
		mobile_rot_right = false
		mobile_left = false
		mobile_right = false
		mobile_down = false
	 }
}
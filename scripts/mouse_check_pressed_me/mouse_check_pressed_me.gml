///@param mb
///Did I get pressed
function mouse_check_pressed_me(argument0) {
	return mouse_check_button_pressed(argument0) && position_meeting(mouse_x,mouse_y,id);
}

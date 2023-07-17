/// @description Insert description here
if os_type == os_android {
	if !place_meeting(mouse_x,mouse_y,obj_newuser_continue) {
		dialog = get_string_async("Please enter your name",text);
	}
}
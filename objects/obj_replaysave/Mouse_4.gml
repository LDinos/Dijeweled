/// @description Insert description here
if os_type == os_android {
	if !place_meeting(mouse_x,mouse_y,obj_replaysave_continue) && !place_meeting(mouse_x,mouse_y,obj_replaysave_cancel) {
		dialog = get_string_async("Please provide name for your replay",text);
	}
}
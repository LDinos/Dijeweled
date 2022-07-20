/// @description Insert description here
if obj_CUS_general.canclick
{
	if position_meeting(mouse_x,mouse_y,id)
	{
		if os_type == os_android {
			dialog = get_string_async("Input",value);
		}
		on_focus = true
		flick = "|"
		alarm[0] = 30
	}
	else
	{
		alarm[0] = -1
		on_focus = false
		flick = ""
	}
} else on_focus = false

if !on_focus
{
	if (value = "") value = string(min_val)
}
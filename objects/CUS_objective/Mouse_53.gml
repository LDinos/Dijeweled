/// @description Insert description here
if obj_CUS_general.canclick && hasinput
{
	if position_meeting(mouse_x,mouse_y,id)
	{
		on_focus = true
		blink = "|"
		alarm[1] = 30
	}
	else
	{
		alarm[1] = -1
		on_focus = false
		blink = ""
	}
} else on_focus = false

if !on_focus
{
	if (text2 = "") text2 = string(min_val)
}
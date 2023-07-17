/// @description Insert description here
if obj_CUS_general.canclick
{
	if position_meeting(mouse_x,mouse_y,id)
	{
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
/// @description Insert description here
if obj_CUS_general.canclick
{
enabled = !enabled
if enabled
{
	obj_CUS_doom.y += 7*16
	obj_CUS_skulls.y += 7*16
	instance_activate_object(CUS_bombs_turns)
	instance_activate_object(CUS_bombs_counter)
	instance_activate_object(CUS_bombs_max)
}
else
{
	obj_CUS_doom.y -= 7*16
	obj_CUS_skulls.y -= 7*16
	instance_deactivate_object(CUS_bombs_turns)
	instance_deactivate_object(CUS_bombs_counter)
	instance_deactivate_object(CUS_bombs_max)
}
}
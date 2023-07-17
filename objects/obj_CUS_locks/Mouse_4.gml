/// @description Insert description here
if obj_CUS_general.canclick
{
	enabled = !enabled
	if enabled
	{
		obj_CUS_coals.y += 5*16
		instance_activate_object(CUS_locks_turns)
		instance_activate_object(CUS_locks_max)
	}
	else
	{
		obj_CUS_coals.y -= 5*16
		instance_deactivate_object(CUS_locks_turns)
		instance_deactivate_object(CUS_locks_max)
	}
}
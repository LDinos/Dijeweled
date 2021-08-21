/// @description Insert description here
if obj_CUS_general.canclick
{
	enabled = !enabled
	if enabled
	{
		//obj_CUS_coals.y += 5*16
		instance_activate_object(CUS_coals_turns)
		instance_activate_object(CUS_coals_max)
		instance_activate_object(CUS_coals_chance)
		instance_activate_object(CUS_coals_random)
	}
	else
	{
		//obj_CUS_coals.y -= 5*16
		instance_deactivate_object(CUS_coals_turns)
		instance_deactivate_object(CUS_coals_max)
		instance_deactivate_object(CUS_coals_chance)
		instance_deactivate_object(CUS_coals_random)
	}
}
/// @description Insert description here
if obj_CUS_general.canclick
{
	enabled = !enabled
	if enabled
	{
		obj_CUS_companion.y += 5*16
		instance_activate_object(CUS_ice_turns)
		instance_activate_object(CUS_ice_max)
	}
	else
	{
		obj_CUS_companion.y -= 5*16
		instance_deactivate_object(CUS_ice_turns)
		instance_deactivate_object(CUS_ice_max)
	}
}
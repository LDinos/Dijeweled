/// @description Insert description here
if obj_CUS_general.canclick
{
	enabled = !enabled
	if enabled
	{
		instance_activate_object(CUS_companion_num)
		instance_activate_object(CUS_companion_locked)
	}
	else
	{
		instance_deactivate_object(CUS_companion_num)
		instance_deactivate_object(CUS_companion_locked)
	}
}
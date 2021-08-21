/// @description Insert description here
if obj_CUS_general.canclick
{
	enabled = !enabled
	if enabled
	{
		instance_activate_object(CUS_skull_counter)
		instance_activate_object(CUS_skull_max)
	}
	else
	{
		instance_deactivate_object(CUS_skull_counter)
		instance_deactivate_object(CUS_skull_max)
	}
}
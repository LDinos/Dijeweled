/// @description Insert description here
if obj_CUS_general.canclick
{
	enabled = !enabled
	if enabled
	{
		obj_CUS_skulls.y += 3*16
		instance_activate_object(CUS_doom_counter)
	}
	else
	{
		obj_CUS_skulls.y -= 3*16
		instance_deactivate_object(CUS_doom_counter)
	}
}
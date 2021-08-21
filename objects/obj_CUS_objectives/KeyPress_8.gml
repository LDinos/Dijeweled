/// @description Insert description here
if !obj_CUS_general.canclick
{
	if !instance_exists(obj_returntomain)
	{
	obj_CUS_general.canclick = true
	instance_destroy(obj_goal_selector)
	instance_destroy(obj_CUS_patternboard)
	instance_destroy(obj_CUS_patterngems)
	instance_destroy(obj_patternconfirm)
	}
}
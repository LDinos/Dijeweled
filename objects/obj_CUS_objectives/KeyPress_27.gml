/// @description Insert description here
if obj_CUS_general.canclick
{
	obj_CUS_general.canclick = false
	instance_create_depth(0,0,-9,obj_returntomain)
	instance_create_depth(464,432,-10,obj_YES)
	instance_create_depth(704,432,-10,obj_NO)
}
else
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
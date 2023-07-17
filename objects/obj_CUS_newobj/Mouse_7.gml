/// @description Insert description here
if enabled & obj_CUS_general.canclick
{
	obj_CUS_general.canclick = false
	instance_create_depth(0,0,-5,obj_goal_selector)
}

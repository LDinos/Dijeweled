/// @description Insert description here
if enabled & obj_CUS_general.canclick
{/*
	obj_CUS_objectives.objectives++
	var delat = instance_create(x,y-16,obj_CUS_delatobj)
	delat.index = obj_CUS_objectives.objectives
	if obj_CUS_objectives.objectives > 3 
	{
		enabled = false
	}*/
	obj_CUS_general.canclick = false
	instance_create_depth(0,0,-5,obj_goal_selector)
}

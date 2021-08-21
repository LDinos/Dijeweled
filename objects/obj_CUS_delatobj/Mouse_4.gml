/// @description Insert description here
if obj_CUS_general.canclick
{
	global.canpress = false
	mouse_clear(mb_left)
	obj_CUS_newobj.enabled = true
	obj_CUS_objectives.objectives--
	var ind = index
	with(obj_CUS_delatobj) 
	{
		if (id != other.id)
		{
			if (ind < index) 
			{
				alarm[0] = 1		
			}
		}
	}
	with(CUS_objective) 
	{
		if (ind < index) 
		{
			alarm[0] = 1		
		}
		else if ind == index instance_destroy()
	}
	instance_destroy(id)
}
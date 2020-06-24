/// @description Insert description here
if hover > -1
{
	#region find type
	var type = 0 //blue nothing
	if (hover > 41) type = 1 //red 
	else if (hover !=0) && (hover != 36) type = 3 //typer
	else if (hover !=0) type = 2 //pencil
	#endregion
	#region find if hasinput
	var inp = false
	if (type = 3) || (hover == 44) || (hover == 45) inp = true
	#endregion
	
	with(obj_CUS_newobj)
	{
		obj_CUS_objectives.objectives++
		var delat = instance_create_depth(x,y-16,-2,obj_CUS_delatobj)
		delat.index = obj_CUS_objectives.objectives
		var delat = instance_create_depth(x,y-16,-1,CUS_objective)
		delat.index = obj_CUS_objectives.objectives
		delat.text = other.info[other.hover,0]
		delat.image_index = type
		delat.hasinput = inp
		delat.hover = other.hover
		if obj_CUS_objectives.objectives > 3 
		{
			enabled = false
		}
		if (other.hover = 42) || (other.hover = 46)
		{
			delat.hastickbox = true
			delat.hastickbox = true
			delat.texttickbox = "Ends game"
			if (other.hover = 46) delat.amticked = true
		}
	}
	obj_CUS_general.canclick = true
	instance_destroy()	
}
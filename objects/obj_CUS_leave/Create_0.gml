/// @description
function return_to_menu() {
	if obj_CUS_general.canclick
	{
		obj_CUS_general.canclick = false
		instance_create_depth(0,0,-9,obj_returntomain)
		instance_create_depth(464,432,-10,obj_YES)
		instance_create_depth(704,432,-10,obj_NO)
	}
}



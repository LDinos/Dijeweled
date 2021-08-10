///@param points
function create_fruit_text(argument0) {
	if global.ShowScore
	{
		var f = instance_create(x,y,obj_fruit_text)
		f.text = argument0*Gamerule_1.xplier
	}


}

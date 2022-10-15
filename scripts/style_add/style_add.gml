///@param points
///@param combo_true
function style_add(argument0, argument1) {
	var c = combo
	if !argument1 c = 0
	if Gamerule_1.points_type == 2
	{
		var g = Gamerule_1.points_base_value;
		var value = argument0 + g*(xplier-1) + c*g*xplier
	}
	else
	{
		var value = argument0*xplier + c*100*xplier
	}
	style += value

	if global.online
	{
		if (!Gamerule_1.lightOn && !Gamerule_1.hypeOn)
		{
			network_send(NN_STYLE_ADD, [buffer_u16], [value])
			
		}
	}


}

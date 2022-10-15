///@param points
function points_add_nocombo(argument0) {
	if Gamerule_1.points_allowed
	{
		if Gamerule_1.points_type == 2
		{
			var g = Gamerule_1.points_base_value;
			var value = argument0 + g*(xplier-1)
		}
		else {var value = argument0*xplier}
		points += value
	
		if global.online
		{
			if (!Gamerule_1.lightOn && !Gamerule_1.hypeOn)
			{
				network_send(NN_POINTS_ADD, [buffer_u16], [value])
				
			}
		}
	}




}

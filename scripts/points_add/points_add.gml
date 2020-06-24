///@param points
///@param compliment
if Gamerule_1.points_allowed
{
	if Gamerule_1.points_type == 2
	{
		var g = Gamerule_1.points_base_value;
		var value = argument0 + g*(xplier-1) + combo*g*xplier
	}
	else {var value = argument0*xplier + combo*100*xplier}
	points += value
	if argument1
	{
		compliment_points += argument0 + combo*100
		event_user(0)
	}
	with(obj_zenify) if cooldown zenify_points += value
	
	if global.online
	{
		if (!Gamerule_1.lightOn && !Gamerule_1.hypeOn)
		{
			with(global.mynet)
			{
				buffer_seek(buffer,buffer_seek_start,0)
				buffer_write(buffer,buffer_u8,NN_POINTS_ADD)
				buffer_write(buffer,buffer_u16,value)
				network_send_packet(client_socket,buffer,buffer_tell(buffer))
			}
		}
	}
	
}

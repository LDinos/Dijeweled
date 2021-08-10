///@param points
///@param combo_true
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
		with(global.mynet)
		{
			buffer_seek(buffer,buffer_seek_start,0)
			buffer_write(buffer,buffer_u8,NN_STYLE_ADD)
			buffer_write(buffer,buffer_u16,value)
			network_send_packet(client_socket,buffer,buffer_tell(buffer))
		}
	}
}
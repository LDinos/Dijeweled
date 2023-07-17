/// @function network_send(net_indicator, type_array, value_array)
/// @description Send data
/// @param {int} net_indicator buffer_u8 data type indicator
/// @param {array} type_array An array of the types corresponding to the values
/// @param {array} value_array An array of the values themselves
function network_send(net_indicator, type_array = [], value_array = []) {
	with(global.mynet) {
		buffer_seek(buffer,buffer_seek_start,0)
		buffer_write(buffer,buffer_u8,net_indicator)	
		for(var i = 0; i < array_length(type_array); i++) {
			buffer_write(buffer,type_array[i],value_array[i])
		}
		network_send_packet(client_socket,buffer,buffer_tell(buffer))
	}
}
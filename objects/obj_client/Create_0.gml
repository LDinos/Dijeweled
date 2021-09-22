/// @description If you press join and connecto, this will be created. Gets info from server
// You can write your code in this editor
network_set_config(network_config_connect_timeout,6000)
client_socket = network_create_socket(network_socket_tcp);
server = network_connect(client_socket , network_resolve(global.ip), 6969);
buffer = buffer_create(1,buffer_grow,1)
if server < 0
    {
		room_goto(rm_ipjoin)
		network_destroy(client_socket)
		instance_destroy()
    }
else
    {
		room_goto(rm_lobby)
		buffer_seek(buffer,buffer_seek_start,0)
		buffer_write(buffer,buffer_u8,NN_LBY_CONNECTED)
		buffer_write(buffer,buffer_string,global.user)
		network_send_packet(client_socket,buffer,buffer_tell(buffer))
    }


/// @description The server for others to join. Gets created when you host and enter the lobby
ip = "0.0.0.0"
client_socket = noone
server_socket = network_create_server(network_socket_tcp, 6969, 1);
client_connected = false
buffer = buffer_create(1,buffer_grow,1)
network_set_config(network_config_connect_timeout, 6000);

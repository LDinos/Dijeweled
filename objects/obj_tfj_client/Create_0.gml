soc = network_create_socket(network_socket_ws)
connection = network_connect_raw(soc, "127.0.0.1", 6336)
buffer = buffer_create(1,buffer_grow,1)
buffer_write(buffer,buffer_text,"REQ_LOBBIES")
network_send_raw(soc,buffer,buffer_tell(buffer))
buffer_delete(buffer)


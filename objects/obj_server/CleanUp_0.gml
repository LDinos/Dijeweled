/// @description Insert description here
buffer_seek(buffer,buffer_seek_start,0)
buffer_write(buffer,buffer_u8,NN_DISCONNECT)
network_send_packet(client_socket,buffer,buffer_tell(buffer))
network_destroy(server_socket)
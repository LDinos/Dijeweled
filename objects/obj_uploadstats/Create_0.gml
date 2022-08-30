/// @description
client_socket = network_create_socket(network_socket_ws);
buffer = buffer_create(1,buffer_grow,1)
var ip = network_resolve("ldinos.ddns.net")
text = "Attempting stats upload..."
max_alpha = 0.8
min_alpha = 0.2
lerp_alpha = 0
lerp_backwards = false //increase (false) or decrease (true) lerp alpha?
alpha = max_alpha
animate = true
network_connect_raw_async(client_socket, ip, 6970)


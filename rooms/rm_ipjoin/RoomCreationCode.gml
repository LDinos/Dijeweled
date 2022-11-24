if (global.join_ip) != "" {
	obj_serveripjoin.field = global.join_ip
	obj_serveripjoin.join()
	global.join_ip = ""
}
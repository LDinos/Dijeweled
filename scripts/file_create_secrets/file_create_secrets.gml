var l = ds_list_create()
	l[| 0] = false //twist
	l[| 1] = false //compact
	l[| 2] = false //swift
	l[| 3] = false //survivor
ini_open("secrets.ini")
	var str = ds_list_write(l)
	ini_write_string("secret","data",str)
ini_close()

ds_list_destroy(l)
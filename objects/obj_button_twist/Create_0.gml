/// @description Insert description here
image_speed = 0
xx = x
var_inside = 0
alarm[0] = 1

if !file_exists("secrets.ini") file_create_secrets()

var l = ds_list_create()
ini_open("secrets.ini")
	var str = ini_read_string("secret","data","")
	ds_list_read(l,str)
ini_close()

unlocked = l[| 0]
if global.debug unlocked = true
ds_list_destroy(l)
/// @description Insert description here
if global.IAMHOST
{
	global.mynet = obj_server
}
else
{
	global.mynet = obj_client
}
consecutive_first = true
consecutive_writing = 0
blink = ""
text = ""
log = ds_list_create()
colorlog = ds_list_create()
maxlines = 9
alarm[0] = 30

/// @description Insert description here
/*if global.IAMHOST
{
	global.mynet = obj_server
}
else
{
	global.mynet = obj_client
}*/
consecutive_first = true
consecutive_writing = 0
blink = ""
text = ""
log = ds_list_create()
colorlog = ds_list_create()
maxlines = 9
alarm[0] = 30

function send_message() {
	consecutive_writing = 0
	consecutive_first = true
	alarm[1] = -1
	var txt = global.user + ": " + text
	text = chat_write(txt,c_white)	
	network_send(NN_CHAT, [buffer_string], [txt])
}
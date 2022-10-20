/// @description Text box that takes IP input
// You can write your code in this editor
hide_ip = false
convert = false //convert numbers to x's every time a character is typed
text_length = 25
once = false
blink = "|"
alarm[0] = 30
image_speed = 0
field = "127.0.0.1"
field_converted = "127.0.0.1"
x = 636
y = 392
function join() {
	if field != ""
	{
		global.ip = field
		global.mynet = obj_client
		instance_create(x,y,obj_client)
	}
}
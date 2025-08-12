/// @description
#macro INPUT_ALPHABET "abcdefghijklmnopqrstuvwxyz"
#macro INPUT_CAPITALS "ABCDEFGHIJKLMNOPQRSTUVWXYZ"
#macro INPUT_NUMBERS "0123456789"

blink = function() {
	alarm[0] = 30
}

enter_function = function(output) {}

close = function() {
	global.canbepressed = true
	instance_destroy(button)
	instance_destroy()
}

enter = function() {
	if (input == "") return;
	var output = input
	enter_function(output)
	close()
}

get_button_coords = function() {
	return {
		x: x + sprite_width/2,
		y: y + sprite_height - 32
	}
}

depth = -999
keyboard_string = ""
x = room_width/2 - sprite_width/2
y = room_height/2 - sprite_height/2
description_x = x + sprite_width/2
description_y = y + sprite_height/4
description = ""
blinker = "|"
input_enabled = true
input = ""
input_strings_allowed = INPUT_NUMBERS
max_length = 10
button = noone
//owner = noone
blink()




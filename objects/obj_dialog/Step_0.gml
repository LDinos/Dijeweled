/// @description
if (keyboard_lastkey == vk_enter) enter()
else if(keyboard_lastkey != vk_nokey) {
	var old_input = input;
    input = keyboard_string;
	var allowed_strings = string_explode(input_strings_allowed)
	var lastchar = keyboard_lastchar
	if (keyboard_lastkey == vk_backspace) lastchar = ""
	if (lastchar != "") {
		if (!array_contains(allowed_strings, lastchar) || max_length <= string_length(input)) {
			input = old_input
			keyboard_string = old_input
		}
	}
	keyboard_lastkey = vk_nokey
}




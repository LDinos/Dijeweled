/// @description
base_alpha += 0.25/modifier
if base_alpha < 1 alarm[1] = 1
else alarm[2] = alarm[0] - 4*modifier
show_debug_message(alarm[0])
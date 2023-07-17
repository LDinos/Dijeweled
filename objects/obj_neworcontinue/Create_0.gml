/// @description Insert description here
var o0 = instance_create_depth(x+113,y+97,depth-1,obj_neworcontinuebutts)
var o1 = instance_create_depth(x+337,y+97,depth-1,obj_neworcontinuebutts)
var o2 = instance_create_depth(x+sprite_width-16, y, depth-1, obj_neworcontinue_exit)
with(o1) image_index = 1

button_manager = [o0, o1, o2]
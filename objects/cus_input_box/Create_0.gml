/// @description Insert description here
function set_value(val) {
	value = val
	obj_CUS_general.quest_struct[$ struct_category][$ struct_key] = val
}
msg = -1
description = "-"
input_help = " "
struct_category = ""
struct_key = ""
master = noone
y_diff = 0
box_type = BOX_TYPE_TICK
max_val = 600 //maximum value
min_val = 0 //minimum value
margin = 4 //a little small value after which a text starts
value = "0"
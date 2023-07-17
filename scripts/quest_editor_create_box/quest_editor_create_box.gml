#macro BOX_TYPE_TICK 0
#macro BOX_TYPE_NUM 1

function quest_editor_create_box(_x, _y, type, desc, input_desc, def, _min, _max, category, key) {
	var box = instance_create(_x, _y, CUS_input_box)
	box.description = desc
	box.input_help = input_desc
	box.box_type = type
	box.value = def
	box.min_val = _min
	box.max_val = _max
	box.struct_key = key
	box.struct_category = category
	box.master = id
	box.y_diff = _y - id.y
	if (type == BOX_TYPE_TICK) box.sprite_index = spr_blackcheck
	return box;
}
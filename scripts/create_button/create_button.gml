/// @function create_button(x, y, depth, width, height, text, func)

function create_button(_x, _y, _depth, width, height, text, func) {
	var b = instance_create_depth(_x,_y, _depth, obj_button)
	b.button_width = width
	b.button_height = height
	b.text = text
	b.click = func
	return b
}
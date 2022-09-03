/// @description
var box_halfx = box_width/2
var box_halfy = box_height/2
var boxt_halfx = box_title_width/2
var boxt_halfy = box_title_height/2
var _x = room_width/2
var x2 = _x + box_width*box_name_percentage - box_halfx
var x3 = _x + box_width*box_score_percentage - box_halfx
var x4 = _x + box_width*box_style_percentage - box_halfx
var x5 = _x + box_halfx
_y = 32 + box_title_height

if mouse_over(x2, _y, x5, _y + box_title_height) {
	if (mouse_x < x3) hover = POINTS
	else if (mouse_x < x4) hover = STYLE
	else hover = MATCHES
	
	if mouse_check_button(mb_left) {
		order(hover)
	}
	
} else hover = -1


/// @description
draw_set_font(font2)
centerize_text()
var box_halfx = box_width/2
var box_halfy = box_height/2
var boxt_halfx = box_title_width/2
var boxt_halfy = box_title_height/2
var _y = 32
var _x = room_width/2
var x1 = _x + box_width*box_no_percentage - box_halfx
var x2 = _x + box_width*box_name_percentage - box_halfx
var x3 = _x + box_width*box_score_percentage - box_halfx
var x4 = _x + box_width*0.85 - box_halfx


//TITLE
draw_rectangle_monocolor(_x - boxt_halfx, _y, _x + boxt_halfx, _y + box_title_height, DARK_GRAY, false)
draw_text(_x,_y+boxt_halfy,title)

_y += box_title_height

//BODY TITLES
draw_rectangle_monocolor(_x - box_halfx, _y, _x + box_halfx, _y + box_title_height, DARK_GRAY, false)
draw_text(x1 - (box_width*box_no_percentage)/2, _y+boxt_halfy,"No.")
draw_text(x2 - (x2-x1)/2, _y+boxt_halfy,"Name")
var X = has_level ? x3 - (x3-x2)/2 : x3 - 24
draw_text(X,_y+boxt_halfy,"Score")
if (has_level) draw_text(x4 + 24,_y+boxt_halfy, "Level")

_y += box_title_height
var y2 = _y

//BODY
draw_rectangle_monocolor(_x - box_halfx, _y, _x + box_halfx, _y + box_height, LIGHT_GRAY, false)
draw_line_color(x1,y2,x1,y2+box_height,c_black,c_black)
draw_line_color(x2,y2,x2,y2+box_height,c_black,c_black)
if (has_level) draw_line_color(x3,y2,x3,y2+box_height,c_black,c_black)

for(var i = 1; i <= 10; i++) {
	var _name = stats_board[# i-1, 0]
	var _score = stats_board[# i-1, 1]
	var _level = stats_board[# i-1, 2]

	var c = my_place == i-1 ? c_yellow : c_white
	draw_text_color(x1 - (box_width*box_no_percentage)/2,_y + i*(box_height/10) -  (box_height/20), i, c, c, c, c, 1)
	draw_text_color(x2 - (x2-x1)/2, _y + i*(box_height/10) -  (box_height/20), _name, c, c, c, c, 1)
	draw_text_color(X, _y + i*(box_height/10) -  (box_height/20), _score, c, c, c, c, 1)
	if (has_level) draw_text_color(x4 + 24, _y + i*(box_height/10) -  (box_height/20), _level, c, c, c, c, 1)
	draw_line_color(_x - box_width/2, _y + i*(box_height/10), _x + box_width/2, _y + i*(box_height/10), c_black, c_black)
}


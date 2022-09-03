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
var x4 = _x + box_width*box_style_percentage - box_halfx
var x5 = _x + box_halfx
var title = stats_titles[stats_index]
var c = c_white
//TITLE
draw_rectangle_monocolor(_x - boxt_halfx, _y, _x + boxt_halfx, _y + box_title_height, DARK_GRAY, false)
draw_text(_x,_y+boxt_halfy,title)

_y += box_title_height

//BODY TITLES
draw_rectangle_monocolor(_x - box_halfx, _y, _x + box_halfx, _y + box_title_height, DARK_GRAY, false)
draw_text(x1 - (box_width*box_no_percentage)/2, _y+boxt_halfy,"No.")
draw_text(x2 - (x2-x1)/2, _y+boxt_halfy,"Name")
draw_text(x3 - (x3-x2)/2, _y+boxt_halfy,"Points")
draw_text(x4 - (x4-x3)/2, _y+boxt_halfy, "Style")
draw_text(x5 - (x5-x4)/2, _y+boxt_halfy, "Matches")

_y += box_title_height
var y2 = _y

//BODY
draw_rectangle_monocolor(_x - box_halfx, _y, _x + box_halfx, _y + box_height, LIGHT_GRAY, false)
/*Lines where each title is written on left of it*/
draw_line_color(x1,y2,x1,y2+box_height,c_black,c_black) //NO. |
draw_line_color(x2,y2,x2,y2+box_height,c_black,c_black) //NAME |
draw_line_color(x3,y2,x3,y2+box_height,c_black,c_black) //POINTS |
draw_line_color(x4,y2,x4,y2+box_height,c_black,c_black) //STYLE |

if (stats_loaded) {
	for(var i = 1; i <= 10; i++) {
		if (i + stats_page*10 <= array_length(stats_board)) {
			var _no = i + stats_page*10
			var _name = stats_board[i-1 + stats_page*10][NAME]
			var _score = stats_board[i-1 + stats_page*10][POINTS]
			var _style = stats_board[i-1 + stats_page*10][STYLE]
			var _matches = stats_board[i-1 + stats_page*10][MATCHES]
			var c0 = (global.user == _name) ? c_yellow : c_white
			var c1 = stats_order == POINTS ? c_white : c_gray
			var c2 = stats_order == STYLE ? c_white : c_gray
			var c3 = stats_order == MATCHES ? c_white : c_gray
			draw_text_color(x1 - (box_width*box_no_percentage)/2,_y + i*(box_height/10) -  (box_height/20), _no, c, c, c, c, 1)
			draw_text_color(x2 - (x2-x1)/2, _y + i*(box_height/10) -  (box_height/20), _name, c0, c0, c0, c0, 1)
			draw_text_color(x3 - (x3-x2)/2, _y + i*(box_height/10) -  (box_height/20), _score, c1, c1, c1, c1, 1)
			draw_text_color(x4 - (x4-x3)/2, _y + i*(box_height/10) -  (box_height/20), _style, c2, c2, c2, c2, 1)
			draw_text_color(x5 - (x5-x4)/2, _y + i*(box_height/10) -  (box_height/20), _matches, c3, c3, c3, c3, 1)
			draw_line_color(_x - box_width/2, _y + i*(box_height/10), _x + box_width/2, _y + i*(box_height/10), c_black, c_black)
		}
	}
} else if (!stats_failed) draw_sprite_ext(spr_loading, 1, room_width/2, 32 + box_title_height*2 + box_height/2, 0.5, 0.5, current_time/2, c_white, 1)
else draw_text(room_width/2, 32 + box_title_height*2 + box_height/2, "Unable to retrieve stats")

var hov_y1 = 32 + box_title_height;
var hov_y2 = 32 + box_title_height + box_title_height
if (hover != -1) {
	var hov_x1, hov_x2;
	if (hover == POINTS) {hov_x1 = x2; hov_x2 = x3;}
	else if (hover == STYLE) {hov_x1 = x3; hov_x2 = x4;}
	else if (hover == MATCHES) {hov_x1 = x4; hov_x2 = x5;}
	draw_set_alpha(0.3)
	draw_rectangle_color(hov_x1,hov_y1,hov_x2,hov_y2,c,c,c,c,false)
	draw_set_alpha(1)
}


var sov_x1, sov_x2;
if (stats_order == POINTS) {sov_x1 = x2; sov_x2 = x3;}
else if (stats_order == STYLE) {sov_x1 = x3; sov_x2 = x4;}
else if (stats_order == MATCHES) {sov_x1 = x4; sov_x2 = x5;}
draw_set_alpha(0.2)
draw_rectangle_color(sov_x1,hov_y1,sov_x2,hov_y2,c,c,c,c,false)
draw_set_alpha(1)



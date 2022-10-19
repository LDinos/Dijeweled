/// @description
draw_self()
if (image_index == 1) {//if hovered
	centerize_text()
	draw_set_font(fnt_chat)
	var t = string(obj_online_replay.timer)
	var e = "End"
	with(obj_online_replay) {
		if array_length(avalanche_turns) > 0 {
			e = string(avalanche_turns[0])
		}
	}
	var text = t + " -> " + e
	var w = string_width(text)
	var c = c_black
	var _y = mouse_y - 16
	var _x = mouse_x
	draw_rectangle_color(_x - (w/2) - 4, _y - 8, _x + (w/2) + 4, _y + 8, c,c,c,c, false)
	draw_text(_x, _y, text)
}





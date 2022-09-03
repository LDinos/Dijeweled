/// @description
box_height = 32
box_width = obj_stats_online.box_width
hover = false
gamepad_hover = false
function click() {
	with(obj_stats_online) {
		show_debug_message(array_length(stats_board))
		if ((stats_page*10 + 10) < array_length(stats_board)) {
			stats_page++
		}
	}
}
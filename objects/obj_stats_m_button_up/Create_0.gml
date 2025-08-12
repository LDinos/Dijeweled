/// @description
box_height = 32
box_width = obj_stats_online.box_width
hover = false
gamepad_hover = false
click = function() {
	with(obj_stats_online) {
		if (stats_page > 0) {
			stats_page--
		}
	}
}

/// @description
box_height = 32
box_width = obj_stats_online.box_width

function click() {
	with(obj_stats_online) {
		if (stats_page > 0) {
			stats_page--
		}
	}
}
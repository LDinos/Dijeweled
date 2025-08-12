function level_set_points(argument0) {
	//@param level
	if (room == rm_classic || room == rm_compact) {
		levelpointsneeded = points + 5000 + 6000*(argument0-1)
	}
	else if (amzen) {
		levelpointsneeded = points + 1000 + 2000*(argument0-1)
	}
	else { //tme attack, twist, swift
		levelpointsneeded = points + 5000 + 9000*(argument0-1)
	}
}

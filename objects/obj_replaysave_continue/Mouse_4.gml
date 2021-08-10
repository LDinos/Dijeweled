ini_open(global.string_to_save)
	ini_write_string("replay","title",obj_replaysave.text)
ini_close()
room_goto(rm_stats_blitz)
/// @description Insert description here
if global.canbepressed {
	with(obj_replaylist) {
		if local_list get_online_replays()
		else get_local_replays()
	}
}
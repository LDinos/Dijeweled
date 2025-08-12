/// @description Insert description here
if global.canbepressed {
	with(obj_replaylist) {
		if (list_type == list_types.LOCAL) get_online_replays()
		else if (list_type == list_types.MULTIPLAYER) get_published_replays()
		else if (list_type == list_types.PUBLISHED) get_downloaded_replays()
		else if (list_type == list_types.DOWNLOADED) get_local_replays()
	}
}
/// @description
if (!global.canbepressed) exit;
var controller = obj_replaylist
if (controller.network_uploading) exit;
var list_type = controller.list_type
if (!butt1_hover && !butt2_hover) exit;

if (list_type == list_types.LOCAL || list_type == list_types.MULTIPLAYER) {
	if (butt1_hover) {
		if (controller.network_failed || controller.network_loading) exit;
		if (file[$ "uploaded"] == true) controller.tooltip_show("Replay already in database", c_red, 2*SECOND)
		else obj_replaylist.upload_replay(file)
	}
	else if (butt2_hover) {
		if (list_type == list_types.MULTIPLAYER) {
			fade_to_room(rm_ONLINE_replay)
		}
		else {
			global.replay_match_isplaying = true
			fade_to_room(rm_blitz_matchreplay)
		}
		instance_destroy(obj_replaylist)
	}
}
else if (list_type == list_types.PUBLISHED) {
	var _id = file.id
	with(obj_replaylist) {
		request_replay_data(_id)
		//tooltip_show("Replay successfully downloaded", c_green)
	}
}
else {
	if (file.gamemode != "Blitz") {
		fade_to_room(rm_ONLINE_replay)
	}
	else {
		global.replay_match_isplaying = true
		fade_to_room(rm_blitz_matchreplay)
	}
	instance_destroy(obj_replaylist)
}
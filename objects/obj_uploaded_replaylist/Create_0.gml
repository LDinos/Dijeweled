/// @description
instance_deactivate_object(obj_logo)

function convert_replay_ini_data_to_json() {
	var title = ini_read_string("replay", "title", "")
	var data = ini_read_string("replay", "data", "")
	var date = ini_read_string("replay", "date", "")
	var time = ini_read_string("replay", "time", "-")
	var replay_score = ini_read_string("replay", "score", "-")
	var geode_multiplier = ini_read_real("replay", "geode_xplier", 1)
	var is_twist = ini_read_real("replay", "is_twist", false)
	var replay_ver = ini_read_real("replay", "replay_ver", 1)
	var is_downloaded = ini_read_real("replay", "is_downloaded", false)
	var code = ini_read_string("replay", "code", "")
}

function convert_replay_json_data_to_ini(json) {
	ini_write_string("replay", "title", json.title) 
	ini_write_string("replay", "data", json.data)
	ini_write_string("replay", "date", json.date)
	ini_write_string("replay", "time", json.time)
	ini_write_string("replay", "score", json.score)
	ini_write_real("replay", "geode_xplier", json.geode_xplier)
	ini_write_real("replay", "is_twist", json.is_twist)
	ini_write_real("replay", "replay_ver", json.replay_ver)
	ini_write_real("replay", "is_downloaded", json.is_downloaded)
	ini_write_string("replay", "code", json.code)
}
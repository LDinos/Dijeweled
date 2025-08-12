/// @function script()
/// @description default
/// @param {type} param first parameter
function write_replay_local(){
	var timetouse = "-"
	if Gamerule_1.time_allowed
	{
		timetouse = convert_seconds_to_time(global.timer) 
	}
	var num = 0
	var mydate = string(date_get_day(date_current_datetime())) + "-" + string(date_get_month(date_current_datetime())) + "-" + string(date_get_year(date_current_datetime()))	
	while file_exists("Replays/"+string(num) + ".json")
	{
		num++
	}

	global.string_to_save = "Replays/"+ string(num) + ".json"
	var strct = {
		"data": ds_map_write(Gamerule_1.Replay_match_map),
		"date": mydate,
		"time": timetouse,
		"score": Gamerule_1.points,
		"geode_xplier": Gamerule_1.geode_xplier,
		"is_twist": global.blitz_twist,
		"replay_ver": 2,
		"gamemode": "Blitz",
		"author": global.user
	}
	
	json_write_file(global.string_to_save, strct)

}
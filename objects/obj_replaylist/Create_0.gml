/// @description Insert description here
#macro REPLAY_VER 2
#macro PAGE_SIZE 15

enum list_types {
	LOCAL,
	MULTIPLAYER,
	PUBLISHED,
	DOWNLOADED
}

list_type_strings = [
	"Local",
	"Online",
	"Published",
	"Downloaded"
]

instance_deactivate_object(obj_logo)
instance_create(0,0,obj_replaylist_replay_dialog)
var ar = instance_create(736,112,obj_replaylist_arrow)
with(ar) image_index = 1
instance_create(736,576,obj_replaylist_arrow)
with(obj_menu_tooltip) visible = false

empty = true
page = 1
meet = -1
selected = -1
selected_page = -1
selected_list = -1
list_type = list_types.LOCAL
network_loading = false
network_failed = false
network_uploading = false
filter = ""
uploading_file = -1
client_socket = network_create_socket(network_socket_ws);

ini_open("settings.ini")
var ip_string = ini_read_string("Settings","stats_server","ldinos.ddns.net")
var ip = network_resolve(ip_string)
var port = 6970
network_connect_raw_async(client_socket, ip, port)

get_timer_in_seconds = function(time_str) {
	if (time_str == "5:00") return 300;
	else if (time_str == "3:00") return 180
	else return 60
}

empty_table = function() {
	empty = true
	mydate = []
	mytitle = []
	myscore = []
	mystring = []
	mytime = []
}

tooltip_show = function(text, color, life = 5 * SECOND) {
	instance_destroy(obj_replay_tooltip)
	var t = instance_create(x,y,obj_replay_tooltip)
	t.text = text
	t.color = color
	t.life = life
}

search = function(filter) {
	unselect()
	empty_table()
	page = 1
	request_published_replays(page,filter)
}

change_page = function(increment) {
	if (page + increment < 1) return; // Dont go under 1
	
	if (list_type == list_types.PUBLISHED) {
		if (network_loading || network_failed) return;
		unselect()
		empty_table()
		filter = ""
		page += increment
		request_published_replays(page)
	}
	else {
		if (array_length(mystring) > page*PAGE_SIZE && increment == 1) {
			page += increment
		}
		else if (increment == -1) page += increment
	}
	
}

finalize_download = function(replay_data) {
	obj_replaylist_replay_dialog.file[$ "data"] = replay_data
	var num = 0
	while file_exists("DownloadedReplays/"+string(num) + ".json")
	{
		num++
	}
	var string_to_save = "DownloadedReplays/"+ string(num) + ".json"
	json_write_file(string_to_save, obj_replaylist_replay_dialog.file)
	with(obj_replaylist) tooltip_show("Replay successfully downloaded", c_green)
}

request_replay_data = function(_id) {
	if (network_failed) return;
	network_uploading = true
	var request = {
		"request": "retrieve_replays",
		"type": "getData",
		"id": _id
	}
	var _buffer = buffer_create(1,buffer_grow,1)
	buffer_seek(_buffer,buffer_seek_start,0)
	buffer_write(_buffer,buffer_text,json_stringify(request))
	network_send_raw(client_socket,_buffer,buffer_tell(_buffer))
	buffer_delete(_buffer)
	tooltip_show("Replay downloading...", c_white, -1)
}

update_uploaded_file = function() {
	var file_struct = json_read_parse(uploading_file.path)
	file_struct[$ "uploaded"] = true
	json_write_file(uploading_file.path, file_struct)
	if (list_type == list_types.LOCAL) get_local_replays()
	else get_online_replays()
}

upload_replay = function(data) {
	if (network_failed) return;
	network_uploading = true
	var request = {
		"request": "retrieve_replays",
		"type": "upload",
		"replay_info": data
	}
	var _buffer = buffer_create(1,buffer_grow,1)
	buffer_seek(_buffer,buffer_seek_start,0)
	buffer_write(_buffer,buffer_text,json_stringify(request))
	network_send_raw(client_socket,_buffer,buffer_tell(_buffer))
	buffer_delete(_buffer)
	tooltip_show("Replay uploading...", c_white, -1)
	uploading_file = obj_replaylist_replay_dialog.file
}

parse_requested_replays = function(data) {
	network_loading = false
	if (list_type != list_types.PUBLISHED) return;
	var replay_list = []
	if (array_length(data) == 0) {
		empty = true
		mystring = -1
		return;
	}
	empty = false
	for(var i = 0; i < array_length(data); i++) {
		array_push(replay_list, data[i])
	}
	for(var i = 0; i < array_length(replay_list); i++) {
		var json = replay_list[i]
		mydate[i] = json.date
		mytitle[i] = json.title
		myscore[i] = json.author
		mytime[i] = json.id
		mystring[i] = json
	}
	index = 0
}

request_published_replays = function(page, _filter = "") {
	if (network_loading) return;
	var _buffer = buffer_create(1,buffer_grow,1)
	network_loading = true
	var request = {
		"request": "retrieve_replays",
		"type": "get",
		"page" : page,
		"filter" : _filter
	}
	buffer_seek(_buffer,buffer_seek_start,0)
	buffer_write(_buffer,buffer_text,json_stringify(request))
	network_send_raw(client_socket,_buffer,buffer_tell(_buffer))
	buffer_delete(_buffer)
	filter = _filter
}

get_published_replays = function() {
	with(obj_button_search_replays) visible = true
	unselect()
	empty_table()
	page = 1
	filter = ""
	list_type = list_types.PUBLISHED
	if (!network_failed) request_published_replays(page)
}

get_downloaded_replays = function() {
	with(obj_button_search_replays) visible = false
	var path_parent = "DownloadedReplays/"
	unselect()
	empty_table()
	page = 1
	list_type = list_types.DOWNLOADED
	var file = file_find_first(path_parent+"*.json",0)
	var replay_list = []
	if file != ""
	{
		empty = false
		var _buffer = buffer_load(path_parent+file)
		var _string = buffer_read(_buffer, buffer_string)
		buffer_delete(_buffer)
		var json = json_parse(_string)
		json.path = path_parent+file
		if (json[$ "replay_ver"] == REPLAY_VER) array_push(replay_list, json)
		file = file_find_next()
		while file != ""
		{
			var _buffer = buffer_load(path_parent+file)
			var _string = buffer_read(_buffer, buffer_string)
			buffer_delete(_buffer)
			var json = json_parse(_string)
			json.path = path_parent+file
			if (json[$ "replay_ver"] == REPLAY_VER) array_push(replay_list, json)
			file = file_find_next()
		}
	}
	else mystring = -1
	file_find_close();
	
	array_sort(replay_list, function(a,b) {return compare_dates(a.date, b.date) ? -1 : 1 })
	
	for(var i = 0; i < array_length(replay_list); i++) {
		var json = replay_list[i]
		var gamemode = json[$ "gamemode"]
		var gamemode_val = json[$ "gamemode_val"]
		mydate[i] = json[$ "date"]
		mytitle[i] = json[$ "title"]
		mytime[i] = json[$ "time"]
		myscore[i] = json[$ "author"]
		mystring[i] = json[$ "path"]
	}
	index = 0
	if array_length(mystring) <= 15 index_last = array_length(mystring)
	else index_last = 15
}

get_online_replays = function() {
	with(obj_button_search_replays) visible = false
	unselect()
	empty_table()
	page = 1
	list_type = list_types.MULTIPLAYER
	
	var file = file_find_first("OnlineReplays/*.json",0)
	var replay_list = []
	if file != ""
	{
		empty = false
		var json = json_read_parse("OnlineReplays/"+file)
		json.path = "OnlineReplays/"+file
		if (json[$ "replay_ver"] == REPLAY_VER) array_push(replay_list, json)
		file = file_find_next()
		while file != ""
		{
			var json = json_read_parse("OnlineReplays/"+file)
			json.path = "OnlineReplays/"+file
			if (json[$ "replay_ver"] == REPLAY_VER) array_push(replay_list, json)
			file = file_find_next()
		}
	}
	else mystring = -1
	file_find_close();
	
	array_sort(replay_list, function(a,b) {return compare_dates(a.date, b.date) ? -1 : 1 })
	
	for(var i = 0; i < array_length(replay_list); i++) {
		var json = replay_list[i]
		var gamemode = json[$ "gamemode"]
		var gamemode_val = json[$ "gamemode_val"]
		mydate[i] = json[$ "date"]
		mytitle[i] = json[$ "title"]
		mytime[i] = json[$ "time"]
		myscore[i] = json[$ "gamemode"]
		mystring[i] = json[$ "path"]
	}
	index = 0
	if array_length(mystring) <= 15 index_last = array_length(mystring)
	else index_last = 15
}

get_local_replays = function() {
	with(obj_button_search_replays) visible = false
	unselect()
	empty_table()
	page = 1
	list_type = list_types.LOCAL
	
	var file = file_find_first("Replays/*.json",0)
	var replay_list = []
	if file != ""
	{
		empty = false
		var json = json_read_parse("Replays/"+file)
		json.path = "Replays/"+file
		if (json[$ "replay_ver"] == REPLAY_VER) array_push(replay_list, json)
		//mystring[0] = "Replays/"+file	
		file = file_find_next()
		while file != ""
		{
			var json = json_read_parse("Replays/"+file)
			json.path = "Replays/"+file
			if (json[$ "replay_ver"] == REPLAY_VER) array_push(replay_list, json)
			//mystring[i] = "Replays/"+file
			file = file_find_next()
		}
	}
	else mystring = -1
	file_find_close();
	
	array_sort(replay_list, function(a,b) {return compare_dates(a.date, b.date) ? -1 : 1 })
	for(var i = 0; i < array_length(replay_list); i++) {
		var json = replay_list[i]
		mydate[i] = json.date
		mytitle[i] = json.title
		myscore[i] = json.score
		mytime[i] = json.time
		mystring[i] = json.path
	}
	
	index = 0
	if array_length(mystring) <= 15 index_last = array_length(mystring)
	else index_last = 15
}

select_replay = function(index) {
	selected = index;
	selected_page = page;
	selected_list = list_type
	var json = (list_type == list_types.PUBLISHED) ? mystring[index] : json_read_parse(mystring[index])
	if (list_type == list_types.LOCAL || json.gamemode == "Blitz") {	
			var t = json.time
			if (t != "-") global.timer = get_timer_in_seconds(t)
			global.replay_string = mystring[index]
	}
	else if (list_type == list_types.MULTIPLAYER || json.gamemode != "Blitz") {
		global.online_replay_string = mystring[index]
	}
	json.path = mystring[index]
	obj_replaylist_replay_dialog.file = json
	
}

unselect = function() {
	selected = -1
	selected_page = -1
	selected_list = -1
	obj_replaylist_replay_dialog.file = -1
}

get_local_replays()
tooltip_show("Connecting to Replay database...", c_white, -1)

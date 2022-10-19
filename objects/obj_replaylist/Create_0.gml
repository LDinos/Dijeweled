/// @description Insert description here
instance_deactivate_object(obj_logo)
var ar = instance_create(736,112,obj_replaylist_arrow)
with(ar) image_index = 1
instance_create(736,576,obj_replaylist_arrow)
//maxlist = 15
empty = true
page = 1
meet = -1
local_list = true //are we currently looking at local blitz replays (true) or online replays (False)

function get_online_replays() {
	mydate = []
	mytitle = []
	myscore = []
	mystring = []
	mytime = []
	local_list = false
	empty = true
	page = 1
	var file = file_find_first(working_directory+"/OnlineReplays/*.json",0)
	if file != ""
	{
		empty = false
		var _buffer = buffer_load("OnlineReplays/"+file)
		var _string = buffer_read(_buffer, buffer_string)
		buffer_delete(_buffer)
		var json = json_parse(_string)
		var gamemode = json[$ "gamemode"]
		var gamemode_val = json[$ "gamemode_val"]
		mydate[0] = json[$ "date"]
		mytitle[0] = json[$ "player1_name"] + " VS " + json[$ "player2_name"]
		var gamemode_name = "Avalanche"
		if (gamemode == 0) {
			gamemode_name = "Time Attack"
			var t = "5:00"
			if gamemode_val == 1 t = "3:00"
			else if gamemode_val == 2 t = "1:00"
			mytime[0] = t
		} else mytime[0] = "-"	
		myscore[0] = gamemode_name
		mystring[0] = "OnlineReplays/"+file
		
		var i = 1
		file = file_find_next()
		while file != ""
		{
			var _buffer = buffer_load("OnlineReplays/"+file)
			var _string = buffer_read(_buffer, buffer_string)
			buffer_delete(_buffer)
			var json = json_parse(_string)
			var gamemode = json[$ "gamemode"]
			var gamemode_val = json[$ "gamemode_val"]
			mydate[i] = json[$ "date"]
			mytitle[i] = json[$ "player1_name"] + " VS " + json[$ "player2_name"]
			var gamemode_name = "Avalanche"
			if (gamemode == 0) {
				gamemode_name = "Time Attack"
				var t = "5:00"
				if gamemode_val == 1 t = "3:00"
				else if gamemode_val == 2 t = "1:00"
				mytime[i] = t
			} else mytime[i] = "-"	
			myscore[i] = gamemode_name
			mystring[i] = "OnlineReplays/"+file
			
			i++
			file = file_find_next()
		}
	}
	else mystring = -1
	file_find_close();
	index = 0
	if array_length(mystring) <= 15 index_last = array_length(mystring)
	else index_last = 15
}

function get_local_replays() {
	mydate = []
	mytitle = []
	myscore = []
	mystring = []
	mytime = []
	local_list = true
	empty = true
	page = 1
	var file = file_find_first(working_directory+"/Replays/*.rep",0)
	if file != ""
	{
		empty = false
		ini_open("Replays/"+file)
			mydate[0] = ini_read_string("replay","date","-")
			mytitle[0] = ini_read_string("replay","title","Untitled")
			myscore[0] = ini_read_real("replay","score",0)
			var t = ini_read_real("replay","time",0)
			mytime[0] = convert_seconds_to_time(t)
		ini_close()
		mystring[0] = "Replays/"+file	
		var i = 1
		file = file_find_next()
		while file != ""
		{
			ini_open("Replays/"+file)
				mydate[i] = ini_read_string("replay","date","-")
				mytitle[i] = ini_read_string("replay","title","Untitled")
				myscore[i] = ini_read_real("replay","score",0)
				var t = ini_read_real("replay","time",0)
				mytime[i] = convert_seconds_to_time(t)
			ini_close()
			mystring[i] = "Replays/"+file
		
			i++
			file = file_find_next()
		}
	}
	else mystring = -1
	file_find_close();
	index = 0
	if array_length(mystring) <= 15 index_last = array_length(mystring)
	else index_last = 15
}

get_local_replays()


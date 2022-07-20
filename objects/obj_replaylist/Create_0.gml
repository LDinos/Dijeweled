/// @description Insert description here
instance_deactivate_object(obj_logo)
var ar = instance_create(736,112,obj_replaylist_arrow)
with(ar) image_index = 1
instance_create(736,576,obj_replaylist_arrow)
//maxlist = 15
empty = true
page = 1
meet = -1
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
with(obj_challenges_selection)
{
	var filename = working_directory +"/CustomQuests/"+string(index)+".ini"
	if file_exists(filename)
	{
		ini_open(filename)
			var edit = ini_read_real("isEditable","value",1)
		ini_close()
		var edl = instance_create(x+sprite_width,y,obj_editdelete)
		edl.index = index
		//if !edit edl.editable = false
	}
}

ini_open("challenges.ini") //unlock all custom challenges
	for(var j=0;j<6;j++)
	{
		if !file_exists(string(j)+".ini")
		{
			ini_write_real("Info","26:"+string(j)+"-Status",0)
			ini_write_string("Challenges","26:"+string(j),"Create a Custom Quest")
			ini_write_string("Info","26:"+ string(j)+"-Matchless Moves","untick")
			ini_write_string("Info","26:"+ string(j)+"-Challenge Bonus","untick")
			ini_write_string("Info","26:"+ string(j)+"-Multiplier","untick")
			ini_write_string("Info","26:"+ string(j)+"-multiswap_allowed","untick")
			ini_write_string("Info","26:"+ string(j)+"-Hypercubes","untick")
			ini_write_string("Info","26:"+ string(j)+"-Bombs","untick")
			ini_write_string("Info","26:"+ string(j)+"-Dooms","untick")
			ini_write_string("Info","26:"+ string(j)+"-Skulls","untick")
			ini_write_string("Info","26:"+ string(j)+"-Locks","untick")
			ini_write_string("Info","26:"+ string(j)+"-Ice","untick")
			ini_write_string("Info","26:"+ string(j)+"-Coals","untick")
			ini_write_string("Info","26:"+ string(j)+"-Time","untick")
			ini_write_real("Info","26:"+ string(j)+"-Difficulty",0) //1-10
		}
		else
		{
			if ini_read_real("Info","26:"+string(j)+"-Status",1) = 1
			{
				ini_write_real("Info","26:"+string(j)+"-Status",0)
			}
		}
	}
ini_close()
if argument0 room_restart()
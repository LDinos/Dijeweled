/// @description Back to challenge room
//Check if we have completed challenge mode
ini_open("challenges.ini")
	var hasseen = ini_read_real("hasseencredits","value",false)
	var stop = true
	if !hasseen
	{
		stop = false
		for(var i = 0; i <26; i++)
		{
			for(var j = 0; j <6; j++)
			{
				var val = ini_read_real("Info",string(i) + ":" + string(j)+"-Status",1)
				if val < 2
				{
					stop = true
					break;
				}
			}
			if stop break;
		}
	}

	if stop fade_to_room(rm_menu_challenges)
	else
	{
		ini_write_real("hasseencredits","value",true)
		fade_to_room(rm_credits)
	}

ini_close()
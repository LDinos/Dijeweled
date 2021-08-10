
	if obj_newuser.text = "your username below"
	{
		obj_newuser.image_index = 2
	}
	else if obj_newuser.image_index = 2 && obj_newuser.text = "something else"
	{
		obj_newuser.image_index = 3
	}
	else if obj_newuser.image_index = 3
	{
		ini_open("settings.ini")
			ini_write_string("Settings", "user", "Poop")
		ini_close()
		room_goto(rm_menu)
	}
	else
	{
		if obj_newuser.text != ""
		{
		ini_open("settings.ini")
			ini_write_string("Settings", "user", obj_newuser.text)
		ini_close()
		room_goto(rm_menu)
		}
	}
	obj_newuser.text = ""

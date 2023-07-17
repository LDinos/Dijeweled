///Returning from Pause, so we have to delete whatever pause object has created
function return_from_pause() {
	if room != rm_credits
	{
		if !global.online
		{
			if !global.paused
			{
				instance_deactivate_all(true)
				instance_activate_object(obj_background_shadered)
				instance_create_depth(0,room_height-720,-99,obj_pause)
			}
			else
			{
				instance_destroy(obj_pause_blackness)
				instance_destroy(obj_pause)
				instance_activate_all()
				with(Board_1)
				{
					ini_open("settings.ini")
					var trans = ini_read_real("Settings","TransparentBoard",0)
					if trans = 0 image_alpha = 1
					else image_alpha = 0.8
					ini_close()
				}
			}
			global.paused = !global.paused
		}
		else
		{
			if !global.paused
			{
				instance_create_depth(0,room_height-720,-99,obj_pause)
				instance_create_depth(0,0,-98,obj_pause_blackness)
				global.paused = true
			}
			else
			{
				instance_destroy(obj_pause_blackness)
				instance_destroy(obj_pause)
				with(Board_1)
				{
					ini_open("settings.ini")
					var trans = ini_read_real("Settings","TransparentBoard",0)
					if trans = 0 image_alpha = 1
					else image_alpha = 0.8
					ini_close()
				}
				with(Board_2)
				{
					if trans = 0 image_alpha = 1
					else image_alpha = 0.8
				}
				global.paused = false
			}
		}
		//else {room_goto(rm_menu); audio_stop_all()}
	}


}

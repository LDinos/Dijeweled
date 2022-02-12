/// @description Window size value update
if window_has_focus() && (os_type != os_android)
{
		var w = window_get_width()
		var h = window_get_height()
		/* I have to see when the screen size changes so I can reload the surface and make it clean and sharp again */
		if (mysizex != w) || (mysizey != h)
		{	
			//if !window_get_fullscreen() window_set_size(display_get_gui_width(), display_get_gui_width()/(16/9))
			if (w != 0 && h != 0) surface_resize(application_surface, w, h)	
			if (window_get_width() != 1280) && (window_get_height() != 720)
			{
				if (window_get_width() != 720) && (window_get_height() != 405)
				{
					if (window_get_width() != 1600) && (window_get_height() != 900)
					{
						if (window_get_width() != 1920) && (window_get_height() != 1080)
						{
							ini_open("settings.ini")
								ini_write_string("Settings","Size","Custom")
								ini_write_real("Settings","custom_width",window_get_width())
								ini_write_real("Settings","custom_height",window_get_height())
							ini_close()
						}
					}
				}
			}
		}

		mysizex = w
		mysizey = h
	/*---------------------*/

	if keyboard_check_pressed(vk_f11)
	{
		window_set_fullscreen(!window_get_fullscreen())
		ini_open("settings.ini")
			ini_write_real("Settings","Fullscreen",window_get_fullscreen())
		ini_close()
	}
}
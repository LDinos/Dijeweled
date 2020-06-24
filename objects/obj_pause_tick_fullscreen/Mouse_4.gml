/// @description Insert description here
if !window_get_fullscreen()
{
	image_index = 1
	window_set_fullscreen(true)
}
else
{
	image_index = 0
	window_set_fullscreen(false)
}

ini_open("settings.ini")
	ini_write_real("Settings","Fullscreen",image_index)
ini_close()
/// @description Insert description here
if global.OPT_magnifyallowed
{
	image_index = 0
	 global.OPT_magnifyallowed = false
}
else
{
	image_index = 1
	 global.OPT_magnifyallowed = true
}

ini_open("settings.ini")
	ini_write_real("Settings","Magnify",image_index)
ini_close()
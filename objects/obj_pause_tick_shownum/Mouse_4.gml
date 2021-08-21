/// @description Insert description here
if global.ShowScore
{
	image_index = 0
	 global.ShowScore = false
}
else
{
	image_index = 1
	global.ShowScore = true
}

ini_open("settings.ini")
	ini_write_real("Settings","ShowScore",image_index)
ini_close()
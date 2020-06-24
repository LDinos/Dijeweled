/// @description Insert description here
if global.OPT_lightallowed
{
	image_index = 0
	 global.OPT_lightallowed = false
}
else
{
	image_index = 1
	 global.OPT_lightallowed = true
}

ini_open("settings.ini")
	ini_write_real("Settings","LightEffects",image_index)
ini_close()
/// @description Insert description here
image_speed = 0
depth = -100
ini_open("settings.ini")
	image_index = ini_read_real("Settings","LightEffects",1)
ini_close()
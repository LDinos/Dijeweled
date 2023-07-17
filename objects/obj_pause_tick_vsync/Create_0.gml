/// @description Insert description here
image_speed = 0
depth = -100
ini_open("settings.ini")
	image_index = ini_read_real("Settings","VSync",0)
ini_close()
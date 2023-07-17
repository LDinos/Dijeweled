/// @description Insert description here
ini_open("settings.ini")
	ini_write_real("Settings","VolFX",global.VolFX)
	ini_write_real("Settings","VolMus",global.VolMus)
	ini_write_real("Settings","VolVO",global.VolVO)
ini_close()

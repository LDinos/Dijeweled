/// @description Insert description here
display_set_sleep_margin(text2)
ini_open("settings.ini")
	ini_write_string("Settings","SleepMargin",text2)
ini_close()
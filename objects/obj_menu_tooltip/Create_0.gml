/// @description Insert description here
ini_open("settings.ini")
	global.user = ini_read_string("Settings","user","someone")
	var user = global.user
ini_close()
x = room_width/2
y = room_height - 32
deftext = "Greetings, " + user + "!"
text = deftext
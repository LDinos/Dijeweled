/// @description Insert description here
ini_open("settings.ini")
	global.user = ini_read_string("Settings","user","someone")
	var user = global.user
ini_close()
x = room_width/2
y = room_height - 32
deftext = choose(
"Greetings, " + user + "!",
"What's up, " + user + "?",
"Hello " + user + "!",
"What will you play today " + user + "?",
"What are you up to " + user + "?"
)
text = deftext
/// @description Insert description here
max_length = 20
ini_open("settings.ini")
	global.user = ini_read_string("Settings","user","someone")
	var temp_text = ""
	var c = (string_length(global.user) > max_length) ? max_length : string_length(global.user)
	for(var i = 1; i <= c; i++) temp_text += string_char_at(global.user, i)
	global.user = temp_text
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
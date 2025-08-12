/// @description Automatically checks for new updates on menu
x = room_width/2
str = "Checking for updates..."
clr = c_yellow
clickable = false
url = ""
draw_set_font(font0)
w = 256//string_width("Update available:")
if os_is_network_connected()
{
	file = http_get_file("https://raw.githubusercontent.com/LDinos/Dijeweled/refs/heads/master/vercheck_v2.txt", "vercheck.txt")
}
else instance_destroy()
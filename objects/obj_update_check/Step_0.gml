/// @description Insert description here
if clickable
{
	if (mouse_x > x - w/2) && (mouse_x < x + w/2) && (mouse_y > y-16) && (mouse_y < y+12)
	{
		clr = c_white
		if mouse_check_button_pressed(mb_left)
		{
			url_open("https://bitbucket.org/LDinos/dijeweled-remastered/downloads/")
		}
	}
	else clr = c_yellow
}
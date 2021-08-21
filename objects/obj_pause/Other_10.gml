/// @description Check choice size

switch(choice)
{
	case 0:
		text = "720x405"
		window_set_size(720,405)
		//window_set_position(720/2,405/2);
		break;
	case 1:
		text = "1280x720"
		window_set_size(1280,720)	
		break;
	case 2:
		text = "1600x900"
		window_set_size(1600,900)
		//window_set_position(1600/2,900/2);
		break;
	case 3:
		text = "1920x1080"
		window_set_size(1920,1080)
		//window_set_position(1920/2,1080/2);
		break;
	case 4:
		text = "Custom"
		//window_set_position(1920/2,1080/2);
		break;
	window_set_position(0,0);
}
ini_open("settings.ini")
	ini_write_string("Settings","Size",text)
ini_close()
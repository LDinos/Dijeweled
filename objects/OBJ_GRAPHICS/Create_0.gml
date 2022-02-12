/// @description Reads window values and does some fullscreen shaders
//////////////////////////////////
surface_depth_disable(true);
uni_time = shader_get_uniform(shd_greyscale,"time");
var_time_var = 0;

uni_mouse_pos = shader_get_uniform(shd_greyscale,"mouse_pos");
var_mouse_pos_x = mouse_x - camera_get_view_x(0);
var_mouse_pos_y = mouse_y - camera_get_view_y(0);

uni_resolution = shader_get_uniform(shd_greyscale,"resolution");
var_resolution_x = room_width
var_resolution_y = room_height

uni_greyscale_fade = shader_get_uniform(shd_greyscale,"fade");
var_greyscale_fade = 0.4;

shader_enabled = false;
surf = surface_create(1280,720)

////////////////////////////////////
//show_message("I get created")
mysizex = display_get_gui_width()
mysizey = display_get_gui_height()
ini_open("settings.ini")
 global.OPT_lightallowed = ini_read_real("Settings","LightEffects",1)
 global.OPT_magnifyallowed = ini_read_real("Settings","Magnify",0)
 global.VSync = ini_read_real("Settings","VSync",0)
 global.ShowScore = ini_read_real("Settings","ShowScore",1)
 if !global.vsync_checked_once 
 {
	 display_reset(display_aa,global.VSync)
	 global.vsync_checked_once = true
}
 text = ini_read_string("Settings","Size","1280x720")
 var isfull = ini_read_real("Settings","Fullscreen",0)
 if isfull != window_get_fullscreen()
 {
	window_set_fullscreen(isfull)
 }
 
if (os_type != os_android) switch(text)
{
	case "720x405":
		window_set_size(720,405)
		break;
		
	case "1280x720":
		window_set_size(1280,720)
		break;
		
	case "1600x900":
		window_set_size(1600,900)
		break;	
	case "1920x1080":
		window_set_size(1920,1080)
		break;
	default:
		var w = ini_read_real("Settings","custom_width",1280)
		var h = ini_read_real("Settings","custom_height",720)
		window_set_size(w,h)
		break;
}
ini_close()
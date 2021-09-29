global.version = "1.11.1" //dont forget to upload vercheck and change windows version on game options!
global.canbepressed = false
global.vsync_checked_once = false
global.mynet = noone
global.gp[0] = 0
var gp_num = gamepad_get_device_count();
for (var i = 0; i < gp_num; i++;)
   {
		if gamepad_is_connected(i) {global.gp[0] = i; break}
   }
if !instance_exists(OBJ_GRAPHICS) instance_create(x,y,OBJ_GRAPHICS)
ini_open("settings.ini")
	global.debug = ini_read_real("Debug","value",false)
	global._discord_allowed = ini_read_real("Settings","discord_allowed",1)
	ini_write_real("Settings","discord_allowed",global._discord_allowed)
ini_close()
if (os_type != os_windows) global._discord_allowed = false
if global._discord_allowed
{
	if discord_init_dll()
		{
			discord_init_app("584549707301519391")
			discord_update_presence("In Main Menu",global.version,"ico_512","")
		}
}

if !file_exists("binds.ini")
{
	ini_open("binds.ini")
		ini_write_real("binds","GP_swapdown",gp_face1)
		ini_write_real("binds","GP_swapright",gp_face2)
		ini_write_real("binds","GP_swapleft",gp_face3)
		ini_write_real("binds","GP_swapup",gp_face4)
		ini_write_real("binds","GP_pass",gp_select)
		ini_write_real("binds","GP_replay",gp_shoulderr)
		ini_write_real("binds","GP_clockwise1",gp_face2)
		ini_write_real("binds","GP_clockwise2",gp_face1)
		ini_write_real("binds","GP_cclockwise1",gp_face3)
		ini_write_real("binds","GP_cclockwise2",gp_face4)
	ini_close()
}
read_gamepad_binds()

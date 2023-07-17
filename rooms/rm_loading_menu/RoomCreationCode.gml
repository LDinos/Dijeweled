#macro DISCORD if (global._discord_allowed)
#macro DISCORD_APP_ID "584549707301519391"
global.join_ip = ""
for(var i = 0; i < parameter_count(); i++) {
	if (parameter_string(i) == "join") {
		show_message(parameter_string(i+1))
		global.join_ip = parameter_string(i+1)
	}
}

global.version = "1.17" //dont forget to upload vercheck and change windows version on game options!

global.canbepressed = false
global.vsync_checked_once = false
global.mynet = noone
global.spectator = false //Am I spectating online match
global.gp[0] = 0
	global.SET_blazing = true
	global.SET_multiswap = true
	global.SET_hyper = false
	global.SET_matchless = false
	global.SET_twist = false
	global.SET_skin = 7
	global.SET_gamemode = 0
	global.SET_ultranovas = true
	global.SET_gamemode2 = 0
var gp_num = gamepad_get_device_count();
global.match_curve = animcurve_get_channel(cur_swap, "channel_swap")
for (var i = 0; i < gp_num; i++;)
   {
		if gamepad_is_connected(i) {global.gp[0] = i; break}
   }
if !instance_exists(OBJ_GRAPHICS) instance_create(x,y,OBJ_GRAPHICS)

if (os_type == os_windows || os_type == os_linux) global._discord_allowed = true
else global._discord_allowed = false
ini_open("settings.ini")
	global.debug = ini_read_real("Debug","value",false)
	if global._discord_allowed {
		global._discord_allowed = ini_read_real("Settings","discord_allowed",1)
		ini_write_real("Settings","discord_allowed",global._discord_allowed)
	}	
ini_close()

DISCORD np_initdiscord(DISCORD_APP_ID, false, "0")

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

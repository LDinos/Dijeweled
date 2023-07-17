/// @description Bindings after pressing "controls" in pause menu
//32769 is the first button for gamepad
function find_gamepad() {
	gamepad_id = noone
	var gp_num = gamepad_get_device_count();
	for (var i = 0; i < gp_num; i++;) {
		if (gamepad_is_connected(i)) {
			gamepad_id = i
			break;
		}
	}
}
unable = false //are we unable to click anything?
n = 32769
click = -1
hover = -1
find_gamepad()
instance_create(x+576,y+560,obj_bindings_return)
#region Bind gamepad names
B_names[0] = "A"
B_names[1] = "B"
B_names[2] = "X"
B_names[3] = "Y"
B_names[4] = "LB"
B_names[5] = "RB"
B_names[6] = "LT"
B_names[7] = "RT"
B_names[8] = "SELECT"
B_names[9] = "START"
B_names[10] = "L3"
B_names[11] = "R3"
B_names[12] = "PAD UP"
B_names[13] = "PAD DOWN"
B_names[14] = "PAD LEFT"
B_names[15] = "PAD RIGHT"
B_names[16] = "LSTICK H"
B_names[17] = "LSTICK V"
B_names[18] = "RSTICK H"
B_names[19] = "RSTICK V"
#endregion

ini_open("binds.ini")
//Binds
B_list[0,0]	= ini_read_real("binds","GP_swapdown",gp_face1) 
B_list[1,0]	= ini_read_real("binds","GP_swapright",gp_face2)
B_list[2,0]	= ini_read_real("binds","GP_swapleft",gp_face3)
B_list[3,0]	= ini_read_real("binds","GP_swapup",gp_face4)
B_list[4,0]	= ini_read_real("binds","GP_pass",gp_select)
B_list[5,0]	= ini_read_real("binds","GP_replay",gp_shoulderr)
B_list[6,0]	= ini_read_real("binds","GP_clockwise1",gp_face2)
B_list[7,0]	= ini_read_real("binds","GP_clockwise2",gp_face1)
B_list[8,0]	= ini_read_real("binds","GP_cclockwise1",gp_face3)
B_list[9,0]	= ini_read_real("binds","GP_cclockwise2",gp_face4)

//Bind descriptions
B_list[0,1] = "Swap Down"
B_list[1,1] = "Swap Right"
B_list[2,1] = "Swap Left"
B_list[3,1] = "Swap Up"
B_list[4,1] = "Zenify/Pass"
B_list[5,1] = "Watch Replay"
B_list[6,1] = "Rotate Clockwise 1"
B_list[7,1] = "Rotate Clockwise 2"
B_list[8,1] = "Rotate C-Clockwise 1"
B_list[9,1] = "Rotate C-Clockwise 2"

B_list[0,2] = "GP_swapdown"
B_list[1,2] = "GP_swapright"
B_list[2,2] = "GP_swapleft"
B_list[3,2] = "GP_swapup"
B_list[4,2] = "GP_pass"
B_list[5,2] = "GP_replay"
B_list[6,2] = "GP_clockwise1"
B_list[7,2] = "GP_clockwise2"
B_list[8,2] = "GP_cclockwise1"
B_list[9,2] = "GP_cclockwise2"

ini_close()

/// @description Insert description here
current_button = 0
gamepad_can_move = 0
gamepad_first_hit = true
prev_mousex = mouse_x
prev_mousey = mouse_y
keyboard_control = false
depth = 2
rot = 0
pos_j = 0
pos_i = 0;

touchedBoard = false;
touchedCCW   = false;

buttonW = 48;
buttonH = 1280;
buttonX = 0;
buttonY = 512;

replay_posi = 0
replay_posj = 0
replay_cc = false

if (global.replay_match_isplaying) {
	Replay_load = ds_map_create()
	var json = json_read_parse(global.replay_string)
	//ini_open(global.replay_string)
		var sect = json.data//ini_read_string("replay","data","-")
		ds_map_read(Replay_load,sect)
		Gamerule_1.geode_xplier = json.geode_xplier//ini_read_real("replay","geode_xplier",1)
		replay_version = json.replay_ver//ini_read_real("replay","replay_ver",0)
	//ini_close()

	random_set_seed(Replay_load[? "seed"])
}
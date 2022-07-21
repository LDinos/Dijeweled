/* PURPOSE */
//Just a box holding general info in Quest Editor. It also holds info for a loaded custom quest when its being edited
filename = working_directory +"/CustomQuests/"+string(global.challenge_index)+".ini"
canclick = true

//Every change we make, it is written in this struct immediately
quest_struct = {
	"General" : {
		"allow_hypes" : false,
		"allow_multiswap" : false,
		"allow_matchless" : true,
		"allow_points" : false,
		"allow_spawn" : true,
		"allow_ahm" : true,
		"lose_on_no_moves" : false,
		"time" : 0,
		"allow_xplier" : false,
		"allow_bonus" : false,
		"allow_wheel" : false,
		"skins" : 7,
		"difficulty" : 0,
	},
	"Bombs" : {
		"turns_to_spawn" : 5,
		"counter" : 15,
		"max" : 4
	},
	"Doom" : {
		"counter" : 15
	},
	"Skulls" : {
		"counter" : 5,
		"max" : 4
	},
	"Locks" : {
		"turns_to_spawn" : 5,
		"max" : 4
	},
	"Coals" : {
		"spawn_randomly" : false,
		"chance" : 5,
		"turns_to_spawn" : 10,
		"max" : 10
	},
	"Ice" : {
		"turns_to_spawn" : 5,
		"max" : 4
	},
	"Companion" : {
		"number" : 1,
		"spawn_locked" : false
	}
}

buttons = [
quest_editor_create_box(x, y + 48 + 0*32, BOX_TYPE_TICK, "Allow Hypercubes", "", false, 0, 1, "General", "allow_hypes"),
quest_editor_create_box(x, y + 48 + 1*32, BOX_TYPE_TICK, "Allow Multiswap", "", false, 0, 1, "General", "allow_multiswap"),
quest_editor_create_box(x, y + 48 + 2*32, BOX_TYPE_TICK, "Allow Matchless Swaps", "", true, 0, 1, "General", "allow_matchless"),
quest_editor_create_box(x, y + 48 + 3*32, BOX_TYPE_TICK, "Allow Points", "", false, 0, 1, "General", "allow_points"),
quest_editor_create_box(x, y + 48 + 4*32, BOX_TYPE_TICK, "Allow Gem Spawn", "", true, 0, 1, "General", "allow_spawn"),
quest_editor_create_box(x, y + 48 + 5*32, BOX_TYPE_TICK, "Always Have Moves (AHM)", "", true, 0, 1, "General", "allow_ahm"),
quest_editor_create_box(x, y + 48 + 6*32, BOX_TYPE_TICK, "Lose on no moves", "", false, 0, 1, "General", "lose_on_no_moves"),
quest_editor_create_box(x, y + 48 + 7*32, BOX_TYPE_NUM, "Time", "Time", "0", 0, 600, "General", "time"),
quest_editor_create_box(x+176, y + 48 + 0*32, BOX_TYPE_TICK, "Allow Multiplier", "", false, 0, 1, "General", "allow_xplier"),
quest_editor_create_box(x+176, y + 48 + 1*32, BOX_TYPE_TICK, "Allow Challenge Bonus", "", false, 0, 1, "General", "allow_bonus"),
quest_editor_create_box(x+176, y + 48 + 2*32, BOX_TYPE_TICK, "Allow Bomb Spinner", "", false, 0, 1, "General", "allow_wheel"),
quest_editor_create_box(x+176, y + 48 + 3*32, BOX_TYPE_NUM, "Gem Colors", "Gem Colors", "7", 3, 7, "General", "skins"),
quest_editor_create_box(x+176, y + 48 + 4*32, BOX_TYPE_NUM, "Difficulty", "Difficulty", "1", 0, 10, "General", "difficulty")
]

if file_exists(filename)
{
	ini_open(filename)
		var s = "General"
		buttons[0].set_value(ini_read_real(s,"hypeallowed",0))
		buttons[1].set_value(ini_read_real(s,"multiswapallowed",0))
		buttons[2].set_value(ini_read_real(s,"illegalsallowed",0))
		buttons[3].set_value(ini_read_real(s,"pointsallowed",0))
		buttons[4].set_value(ini_read_real(s,"spawnallowed",0))
		buttons[5].set_value(ini_read_real(s,"AHMallowed",0))
		buttons[6].set_value(ini_read_real(s,"loseonnomoves",0))
		buttons[7].set_value(ini_read_real(s,"time",0))
		buttons[8].set_value(ini_read_real(s,"xplierallowed",0))
		buttons[9].set_value(ini_read_real(s,"challengeallowed",0))
		buttons[10].set_value(ini_read_real(s,"wheelallowed",0))
		buttons[11].set_value(ini_read_real(s,"skinnum",0))
		buttons[12].set_value(ini_read_real(s,"difficulty",0))		
		CUS_general_description.value = ini_read_string(s,"description","")
	ini_close()
}
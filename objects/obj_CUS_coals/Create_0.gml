/// @description Insert description here

function enable() {
	instance_activate_object(buttons[0])
	instance_activate_object(buttons[1])
	instance_activate_object(buttons[2])
	instance_activate_object(buttons[3])
}

function disable() {
	instance_deactivate_object(buttons[0])
	instance_deactivate_object(buttons[1])
	instance_deactivate_object(buttons[2])
	instance_deactivate_object(buttons[3])
}

enabled = false;
buttons = [
quest_editor_create_box(x, y + 3*16, BOX_TYPE_TICK, "Spawn Randomly", "", false, 0, 1, "Coals", "spawn_randomly"),
quest_editor_create_box(x, y + 5*16, BOX_TYPE_NUM, "Chance to Spawn", "Chance to Spawn", "5", 1, 100, "Coals", "chance"),
quest_editor_create_box(x, y + 7*16, BOX_TYPE_NUM, "Turns to Spawn", "Turns to Spawn", "10", 1, 99, "Coals", "turns_to_spawn"),
quest_editor_create_box(x, y + 9*16, BOX_TYPE_NUM, "Max Coals", "Max Coals", "10", 1, 35, "Coals", "max")
]

var filename = obj_CUS_general.filename
if file_exists(filename)
{
	ini_open(filename)
		var s = "Coals"
		obj_CUS_coals.enabled = ini_read_real(s,"allowed",0)
		if obj_CUS_coals.enabled
		{
			buttons[2].value = string(ini_read_real(s,"turns",1))
			buttons[3].value = string(ini_read_real(s,"max",1))
			buttons[0].enabled = ini_read_real(s,"random",0)
			buttons[1].value = string(ini_read_real(s,"chance",1))
		}
	ini_close()
}

instance_deactivate_object(buttons[0])
instance_deactivate_object(buttons[1])
instance_deactivate_object(buttons[2])
instance_deactivate_object(buttons[3])

if enabled alarm[0] = 1
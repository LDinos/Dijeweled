/// @description Insert description here

function enable() {
	obj_CUS_coals.y += 5*16
	instance_activate_object(buttons[0])
	instance_activate_object(buttons[1])
}

function disable() {
	obj_CUS_coals.y -= 5*16
	instance_deactivate_object(buttons[0])
	instance_deactivate_object(buttons[1])
}

enabled = false;
buttons = [ quest_editor_create_box(x, y + 3*16, BOX_TYPE_NUM, "Turns to Spawn", "Turns to Spawn", "5", 1, 99, "Locks", "turns_to_spawn"),
quest_editor_create_box(x, y + 5*16, BOX_TYPE_NUM, "Max Locks", "Max Locks", "4", 1, 25, "Locks", "max")
]

var filename = obj_CUS_general.filename
if file_exists(filename)
{
	ini_open(filename)
		var s = "Locks"
		obj_CUS_locks.enabled = ini_read_real(s,"allowed",0)
		if obj_CUS_locks.enabled
		{
			buttons[0].value = string(ini_read_real(s,"turns",1))
			buttons[1].value = string(ini_read_real(s,"max",1))
		}
	ini_close()
}

instance_deactivate_object(buttons[0])
instance_deactivate_object(buttons[1])

if enabled alarm[0] = 1
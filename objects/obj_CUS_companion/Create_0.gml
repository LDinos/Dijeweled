/// @description Insert description here

function enable() {
	instance_activate_object(buttons[0])
	instance_activate_object(buttons[1])
}

function disable() {
	instance_deactivate_object(buttons[0])
	instance_deactivate_object(buttons[1])
}

enabled = false;
buttons = [ quest_editor_create_box(x, y + 3*16, BOX_TYPE_NUM, "Number", "Number", "1", 1, 10, "Companion", "number"),
quest_editor_create_box(x, y + 5*16, BOX_TYPE_TICK, "Spawn Locked", "Spawn Locked", false, 0, 1, "Companion", "spawn_locked")
]

var filename = obj_CUS_general.filename
if file_exists(filename)
{
	ini_open(filename)
		var s = "Companion"
		obj_CUS_companion.enabled = ini_read_real(s,"allowed",0)
		if obj_CUS_companion.enabled
		{
			buttons[0].value = string(ini_read_real(s,"num",1))
			buttons[1].enabled = ini_read_real(s,"locked",0)
		}
	ini_close()
}

instance_deactivate_object(buttons[0])
instance_deactivate_object(buttons[1])

if enabled alarm[0] = 1
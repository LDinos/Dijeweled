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
buttons = [ quest_editor_create_box(x, y + 3*16, BOX_TYPE_NUM, "Skull Min Counter", "Skull Min Counter", "5", 1, 99, "Skulls", "counter"),
quest_editor_create_box(x, y + 5*16, BOX_TYPE_NUM, "Max Skulls", "Max Skulls", "15", 1, 15, "Skulls", "max")
]

var filename = obj_CUS_general.filename
if file_exists(filename)
{
	ini_open(filename)
		var s = "Skulls"
		obj_CUS_skulls.enabled = ini_read_real(s,"allowed",0)
		if obj_CUS_skulls.enabled
		{
			buttons[0].value = string(ini_read_real(s,"counter",1))
			buttons[1].value = string(ini_read_real(s,"max",1))
		}
	ini_close()
}

instance_deactivate_object(buttons[0])
instance_deactivate_object(buttons[1])

if enabled alarm[0] = 1
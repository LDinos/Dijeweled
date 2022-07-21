/// @description Insert description here
function enable() {
	obj_CUS_doom.y += 7*16
	obj_CUS_skulls.y += 7*16
	instance_activate_object(buttons[0])
	instance_activate_object(buttons[1])
	instance_activate_object(buttons[2])
}

function disable() {
	obj_CUS_doom.y -= 7*16
	obj_CUS_skulls.y -= 7*16
	instance_deactivate_object(buttons[0])
	instance_deactivate_object(buttons[1])
	instance_deactivate_object(buttons[2])
}

enabled = false;
buttons = [ quest_editor_create_box(x, y + 3*16, BOX_TYPE_NUM, "Turns To Spawn", "Turns To Spawn", "5", 1, 99, "Bombs", "turns_to_spawn"),
	quest_editor_create_box(x, y + 5*16, BOX_TYPE_NUM, "Bomb Counter", "Bomb Counter", "15", 1, 99, "Bombs", "counter"),
	quest_editor_create_box(x, y + 7*16, BOX_TYPE_NUM, "Max Bombs", "Max Bombs", "5", 1, 64, "Bombs", "max")
]


var filename = obj_CUS_general.filename
if file_exists(filename)
{
	ini_open(filename)
		var s = "Bombs"
		obj_CUS_bombs.enabled = ini_read_real(s,"allowed",0)
		if obj_CUS_bombs.enabled
		{
			buttons[0].value = string(ini_read_real(s,"turns",1))
			buttons[1].value = string(ini_read_real(s,"counter",1))
			buttons[2].value = string(ini_read_real(s,"max",1))
		}
	ini_close()
}

for(var i = 0; i < array_length(buttons); i++) instance_deactivate_object(buttons[i])

if enabled alarm[0] = 1
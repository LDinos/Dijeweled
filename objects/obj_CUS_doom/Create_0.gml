/// @description Insert description here
function enable() {
	obj_CUS_skulls.y += 3*16
	instance_activate_object(buttons[0])
}

function disable() {
	obj_CUS_skulls.y -= 3*16
	instance_deactivate_object(buttons[0])
}

enabled = false;
buttons = [ quest_editor_create_box(x, y + 3*16, BOX_TYPE_NUM, "Doom Counter", "Doom Counter", "15", 1, 99, "Doom", "counter")]
var filename = obj_CUS_general.filename
if file_exists(filename)
{
	ini_open(filename)
		var s = "Doom"
		obj_CUS_doom.enabled = ini_read_real(s,"allowed",0)
		if obj_CUS_doom.enabled
		{
			buttons[0].value = string(ini_read_real(s,"counter",1))
		}
	ini_close()
}

for(var i = 0; i < array_length(buttons); i++) instance_deactivate_object(buttons[i])

if enabled alarm[0] = 1
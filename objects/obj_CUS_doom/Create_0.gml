/// @description Insert description here
enabled = false;
instance_create(x,y + 16*3,CUS_doom_counter)

var filename = obj_CUS_general.filename
if file_exists(filename)
{
	ini_open(filename)
		var s = "Doom"
		obj_CUS_doom.enabled = ini_read_real(s,"allowed",0)
		if obj_CUS_doom.enabled
		{
			CUS_doom_counter.value = string(ini_read_real(s,"counter",1))
		}
	ini_close()
}

instance_deactivate_object(CUS_doom_counter)

if enabled alarm[0] = 1
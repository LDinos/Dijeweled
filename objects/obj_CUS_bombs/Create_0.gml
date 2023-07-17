/// @description Insert description here
enabled = false;
instance_create_depth(x,y+ 3*16,-1, CUS_bombs_turns)
instance_create_depth(x,y+ 5*16,-1, CUS_bombs_counter)
instance_create_depth(x,y+ 7*16,-1, CUS_bombs_max)

var filename = obj_CUS_general.filename
if file_exists(filename)
{
	ini_open(filename)
		var s = "Bombs"
		obj_CUS_bombs.enabled = ini_read_real(s,"allowed",0)
		if obj_CUS_bombs.enabled
		{
			CUS_bombs_turns.value = string(ini_read_real(s,"turns",1))
			CUS_bombs_counter.value = string(ini_read_real(s,"counter",1))
			CUS_bombs_max.value = string(ini_read_real(s,"max",1))
		}
	ini_close()
}

instance_deactivate_object(CUS_bombs_turns)
instance_deactivate_object(CUS_bombs_counter)
instance_deactivate_object(CUS_bombs_max)

if enabled alarm[0] = 1
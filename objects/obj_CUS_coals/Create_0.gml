/// @description Insert description here
enabled = false;
instance_create_depth(x,y+ 3*16,-1, CUS_coals_random)
instance_create_depth(x,y+ 5*16,-1, CUS_coals_chance)
instance_create_depth(x,y+ 7*16,-1, CUS_coals_turns)
instance_create_depth(x,y+ 9*16,-1, CUS_coals_max)

var filename = obj_CUS_general.filename
if file_exists(filename)
{
	ini_open(filename)
		var s = "Coals"
		obj_CUS_coals.enabled = ini_read_real(s,"allowed",0)
		if obj_CUS_coals.enabled
		{
			CUS_coals_turns.value = string(ini_read_real(s,"turns",1))
			CUS_coals_max.value = string(ini_read_real(s,"max",1))
			CUS_coals_random.enabled = ini_read_real(s,"random",0)
			CUS_coals_chance.value = string(ini_read_real(s,"chance",1))
		}
	ini_close()
}

instance_deactivate_object(CUS_coals_turns)
instance_deactivate_object(CUS_coals_max)
instance_deactivate_object(CUS_coals_chance)
instance_deactivate_object(CUS_coals_random)

if enabled alarm[0] = 1
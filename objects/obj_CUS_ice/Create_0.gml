/// @description Insert description here
enabled = false;
instance_create_depth(x,y+ 3*16,-1, CUS_ice_turns)
instance_create_depth(x,y+ 5*16,-1, CUS_ice_max)

var filename = obj_CUS_general.filename
if file_exists(filename)
{
	ini_open(filename)
		var s = "Ice"
		obj_CUS_ice.enabled = ini_read_real(s,"allowed",0)
		if obj_CUS_ice.enabled
		{
			CUS_ice_turns.value = string(ini_read_real(s,"turns",1))
			CUS_ice_max.value = string(ini_read_real(s,"max",1))
		}
	ini_close()
}


instance_deactivate_object(CUS_ice_turns)
instance_deactivate_object(CUS_ice_max)

if enabled alarm[0] = 1
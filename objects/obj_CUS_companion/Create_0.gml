/// @description Insert description here
enabled = false;
instance_create_depth(x,y+ 3*16,-1, CUS_companion_num)
instance_create_depth(x,y+ 5*16,-1, CUS_companion_locked)

var filename = obj_CUS_general.filename
if file_exists(filename)
{
	ini_open(filename)
		var s = "Companion"
		obj_CUS_companion.enabled = ini_read_real(s,"allowed",0)
		if obj_CUS_companion.enabled
		{
			CUS_companion_num.value = string(ini_read_real(s,"num",1))
			CUS_companion_locked.enabled = ini_read_real(s,"locked",0)
		}
	ini_close()
}

instance_deactivate_object(CUS_companion_num)
instance_deactivate_object(CUS_companion_locked)

if enabled alarm[0] = 1
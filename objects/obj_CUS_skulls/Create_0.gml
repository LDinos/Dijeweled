/// @description Insert description here
enabled = false;
instance_create(x,y +16*3, CUS_skull_counter)
instance_create(x,y +16*5, CUS_skull_max)

var filename = obj_CUS_general.filename
if file_exists(filename)
{
	ini_open(filename)
		var s = "Skulls"
		obj_CUS_skulls.enabled = ini_read_real(s,"allowed",0)
		if obj_CUS_skulls.enabled
		{
			CUS_skull_counter.value = string(ini_read_real(s,"counter",1))
			CUS_skull_max.value = string(ini_read_real(s,"max",1))
		}
	ini_close()
}

instance_deactivate_object(CUS_skull_counter)
instance_deactivate_object(CUS_skull_max)

if enabled alarm[0] = 1
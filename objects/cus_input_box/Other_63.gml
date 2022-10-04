/// @description
var i_d = ds_map_find_value(async_load, "id");
if i_d == msg
{
    if ds_map_find_value(async_load, "status")
    {
		var num = ds_map_find_value(async_load, "value");
        if !is_real(num) num = value
		else num = clamp(num, min_val, max_val)
		set_value(string(num))
    }
	obj_CUS_general.canclick = true
}



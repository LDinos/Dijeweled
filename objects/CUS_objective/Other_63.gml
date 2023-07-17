/// @description
var i_d = ds_map_find_value(async_load, "id");
if i_d == msg
{
    if ds_map_find_value(async_load, "status")
    {
		var num = ds_map_find_value(async_load, "value");
		if !is_real(num) num = min_val
		num = clamp(num, min_val, max_val)
		text2 = string(num)
    }
	obj_CUS_general.canclick = true
}



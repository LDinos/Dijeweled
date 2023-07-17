/// @description
var i_d = ds_map_find_value(async_load, "id");
if i_d == msg
{
    if ds_map_find_value(async_load, "status")
    {
		var txt = ds_map_find_value(async_load, "result");
        if (txt == "") txt = value
		if (string_length(txt) <= max_val) value = txt
		else txt = value
    }
	obj_CUS_general.canclick = true
}



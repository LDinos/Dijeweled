/// @description Insert description here
if ds_map_find_value(async_load, "id") == file
{
    var status = ds_map_find_value(async_load, "status");
	var full_status = ds_map_find_value(async_load,"http_status");
	str = status
    if status == 0
        {
			var ver = ds_map_find_value(async_load, "result");
			if (ver == global.version) instance_destroy()
			else {str = "Update available: " + ver; clickable = true}
        }
	else {str = "Cannot retrieve info"; alarm[0] = 60*3} //show me the error if status = -1
}
/// @description Insert description here
if ds_map_find_value(async_load, "id") == file
{
    var status = ds_map_find_value(async_load, "status");
	//var full_status = ds_map_find_value(async_load,"http_status");
	str = status
    if status == 0
        {
			//var path = ds_map_find_value(async_load, "result");
			var textfile = file_text_open_read("vercheck.txt")
				var ver = file_text_read_string(textfile)
				file_text_readln(textfile)
				url = file_text_read_string(textfile)
			file_text_close(textfile)
			if (ver == global.version) instance_destroy()
			else if (string_length(ver) == 0) {str = "Cannot retrieve info"; alarm[0] = 60*3}
			else {str = "Update available: " + ver; clickable = true}
        }
	else {str = "Cannot retrieve info"; alarm[0] = 60*3} //show me the error if status = -1
}
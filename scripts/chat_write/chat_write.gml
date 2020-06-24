///@param text
///@param color
if ds_list_size(log) > maxlines
		{
			ds_list_delete(log,0)
			ds_list_delete(colorlog,0)
		}
		ds_list_add(log,argument0)
		ds_list_add(colorlog,argument1)
return "";
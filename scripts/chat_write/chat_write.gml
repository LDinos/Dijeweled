///@param text
///@param color
function chat_write(argument0, argument1) {
	if ds_list_size(log) > maxlines
			{
				ds_list_delete(log,0)
				ds_list_delete(colorlog,0)
			}
			ds_list_add(log,argument0)
			ds_list_add(colorlog,argument1)
	return "";


}

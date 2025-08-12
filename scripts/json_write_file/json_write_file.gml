/// @function json_write_file(path, struct_data)
/// @description Write json file in a directory
/// @param {string} path Path to save the file along with filename and .json extension
/// @param {any} struct_data Data to stringify and save in file as json
/// @param {boolean} dont_stringify Disable stringification of struct_data
function json_write_file(path, struct_data, dont_stringify = false){
	var json_string = dont_stringify ? struct_data : json_stringify(struct_data)
	var _buffer = buffer_create(string_byte_length(json_string), buffer_grow, 1)
	buffer_write(_buffer, buffer_string, json_string)
	buffer_save(_buffer,path)
	buffer_delete(_buffer)
}
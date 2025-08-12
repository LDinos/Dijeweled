/// @function json_read_parse()
/// @description Reads a json file and converts it to struct
/// @param {filepath} string Where the json file is located
function json_read_parse(filepath){
	var _buffer = buffer_load(filepath)
	var _string = buffer_read(_buffer, buffer_string)
	buffer_delete(_buffer)
	var json = json_parse(_string)
	return json;
}
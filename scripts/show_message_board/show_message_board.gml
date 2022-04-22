/// @function script()
/// @description default
/// @param {type} param first parameter
function show_message_board(){
	var str = ""
	for(var i = 0; i < 8; i++) {
		for(var j = 0; j < 8; j++) str += string(gems_skin_array[i][j]) + " "
		str += "\n"
	}
	show_message(str)
}
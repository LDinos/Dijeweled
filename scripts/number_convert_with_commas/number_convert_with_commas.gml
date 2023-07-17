/// @function number_convert_with_commas(text)
/// @description Gets a number, eg "1000" and returns a string with a comma "1,000"
/// @param {real} num Integer long number to give comma to
function number_convert_with_commas(num) {
	var t = string(num)
	var l = string_length(t)
	for(var i = l-3; i > 0; i-= 3) {
		t = string_insert(",", t, i+1)
	}
	return t;
}
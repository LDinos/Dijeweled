///@param seconds
var t = argument0
var minutes = t div 60
var seconds = t mod 60
if seconds > 9
{
	var str = string(minutes) + ":" + string(seconds)
}
else
{
	var str = string(minutes) + ":0" + string(seconds)
}

return str;
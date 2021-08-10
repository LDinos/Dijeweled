/// @description Insert description here
var func =  -power(var_inside - 1,2) + 1
x = lerp(xx, xx + sprite_width + 32, func)
if var_inside < 1
{
	var_inside += 0.05
	alarm[0] = 1
}
else global.canbepressed = true
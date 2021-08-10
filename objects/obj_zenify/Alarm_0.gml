/// @description Insert description here
// You can write your code in this editor
if func < 1
{
	func += 0.02
	index_temp = lerp(index_temp, index, func) //1+ power(func-1,3)
	index_temp_round = round(index_temp)
	alarm[0] = 1
}

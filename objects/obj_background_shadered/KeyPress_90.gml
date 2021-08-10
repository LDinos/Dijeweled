/// @description Insert description here
var cond = true
if (room != rm_debug) cond = Gamerule_1.debug
if cond
{
	if (shd == num_shaders) shd = 0
	else shd++
	show_debug_message(shd)
}
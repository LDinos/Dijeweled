/* Desc

Simple gem outlines that appear on special gem creations or
at bomb countdown warnings.

*/
image_xscale = 0.25
image_yscale = 0.25
depth--
image_speed = 0
image_alpha = 0.7
alarm[0] = 1
alarm[1] =  10
mygem = instance_position(x,y,Gem_1)
if mygem != noone image_index = mygem.skinnum
/* */
/*  */

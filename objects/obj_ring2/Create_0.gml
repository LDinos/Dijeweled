/* Desc

Last ring on fruit explosion, destroys.

*/
//killing = 0
timevar = 0
col1 = make_color_hsv((timevar+5) mod 255,128,255)
modifier = 1
if Gamerule_1.isReplay modifier = 1.5
image_xscale = 0
image_yscale = 0
alarm[0] = 1
alarm[1] = 40 *modifier
alarm[2] = 15 *modifier

/* */
/*  */

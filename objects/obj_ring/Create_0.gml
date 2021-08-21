/* Desc

First and second ring on fruit explosion. Doesn't destroy gems
but adds up to their bomb countdown.

*/
modifier = 1
//if Gamerule_1.isReplay modifier = 2
image_xscale = 0
image_yscale = 0
action_set_alarm(1*modifier,0)
action_set_alarm(40*modifier,1)
action_set_alarm(10*modifier,2)
/* */
/*  */

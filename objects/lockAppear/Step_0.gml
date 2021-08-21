/// @description Insert description here
var func = 0.5-cos(percent/0.5 *(pi/2))/2
rot = lerp(rot1,rot2,func)
percent +=0.04

if percent > 1
{
	percent = 0
	rot2 = -rot2
	rot1 = rot
}

var func = 0.5-cos(percent2/0.5 *(pi/2))/2
xscale = lerp(scale1,scale2,func)
percent2 +=0.02

if percent2 > 1
{
	percent2 = 0
	if scale2 = 1.5
	{
		scale2 = 0.5
	}
	else scale2 = 1.5
	scale1 = xscale
}
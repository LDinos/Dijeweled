/// @description Insert description here
if amount < 1
{
	var p = power(amount-1,3) + 1
	image_yscale = lerp(1,0.6,p)
	//image_yscale = image_xscale
	amount += 0.001
	alarm[0] = 2
}
else {alarm[1] = 60; amount = 0}
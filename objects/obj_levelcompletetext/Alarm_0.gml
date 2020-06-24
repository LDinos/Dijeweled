/// @description Insert description here
if image_xscale < 0.5
{
	image_xscale += 0.05
	image_yscale = image_xscale
	alarm[0] = 1
}
else alarm[1] = 60
/// @description Insert description here
if image_xscale > 0 
{
	image_xscale -= 0.1
	image_yscale = image_xscale
	alarm[1] = 1
}
else instance_destroy()
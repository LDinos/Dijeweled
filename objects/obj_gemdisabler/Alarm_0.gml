/// @description Insert description here
// You can write your code in this editor
//if x != xx
percent += 0.1
{
	x = lerp(xdefault,xx,percent)
}
//else
{
	y = lerp(ydefault,yy,percent)	
}
image_alpha -=0.05
image_xscale -= 0.01
image_yscale -= 0.01

if percent < 1 alarm[0] = 1
else instance_destroy()
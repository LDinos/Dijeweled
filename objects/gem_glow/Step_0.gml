/// @description Insert description here
// You can write your code in this editor
var myglow = collision_point(x,y,Gem_1,false,false)
if (myglow == noone) myglow = collision_point(x,y,Gem_local,false,false)

if myglow != noone
{
	x = myglow.x
	y = myglow.y
}
else instance_destroy()
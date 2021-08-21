/// @description Insert description here
if number > 0 
{
	var sp = instance_create(irandom_range(x-16,x+16),irandom_range(y-16,y+16), obj_xplier_sperm)
	with(sp) alarm[0] = 1
	number--
	alarm[0] = 5
}
else instance_destroy()
/// @description Give sperm
if sperm <= 10 && instance_exists(obj_xplier)
{
	var s = instance_create(x,y,obj_xplier_sperm)
	with(s) alarm[0] = 1
	sperm++
	alarm[5] = 6
	
}
else
{
	sperm = 0
	alarm[2] = 30
}
/// @description Give sperm
if sperm <= 10
{
	var s = instance_create(x,y,obj_xplier_sperm)
	with(s) alarm[0] = 1
	sperm++
	//sperm_travelling = sperm - instance_number(obj_xplier_sperm)
	alarm[5] = 6
	
}
else
{
	sperm = 0
	//sperm_travelling = instance_number(obj_xplier_sperm)
	alarm[2] = 30
}
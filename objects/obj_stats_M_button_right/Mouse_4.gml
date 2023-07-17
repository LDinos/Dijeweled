/// @description Insert description here
with(obj_button_stats_back)
{
	instance_destroy(sts[index])
	if (index < ind_max) index++
	else index = 0
	instance_create(0,0,sts[index])
}
/// @description Insert description here
with(obj_button_stats_back)
{
	instance_destroy(sts[index])
	if (index > 0) index--
	else index = ind_max
	instance_create(0,0,sts[index])
}
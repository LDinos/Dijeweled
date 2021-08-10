/// @description Create sperms
if list_index < list_end
{
	if instance_exists(gem[list_index])
	{
	var sperm = instance_create(x,y,hypercube_sperm)
	sperm.gem_index = gem[list_index]
	sperm.x1 = gem[list_index].x
	sperm.y1 = gem[list_index].y
	sperm.gem_color = gem[list_index].mycolor
	if index = 8{sperm.lim_start = 2; sperm.lim_end = 5;}
	}
	list_index++
	alarm[1] = 4*modifier
}
else alarm[2] = 1*modifier
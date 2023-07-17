/// @description Insert description here
if list_index < list_end
{
	var sperm = instance_create(x,y,hypercube_sperm2)
	//sperm.gem_index = gem[list_index]
	sperm.x1 = gem[list_index,0]
	sperm.y1 = gem[list_index,1]
	sperm.gem_color = mycolor
	if skin_to_hype = 8{sperm.lim_start = 2; sperm.lim_end = 5;}
	list_index++
	alarm[1] = 4*modifier//irandom_range(4,13)
}
else alarm[2] = 1*modifier
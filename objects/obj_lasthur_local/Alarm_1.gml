/// @description doing row by row
// You can write your code in this editor
if j = 8
{
	j = 0
	i++
}

if i != 8
{
	fastness = 1
	if instance_exists(Gamerule_local.gem_board1[i,j])
	{
		if Gamerule_local.gem_board1[i,j].amHype = true 
		{
			fastness = 5;
			with(Gamerule_local.gem_board1[i,j]) {skin_to_hype = irandom(Gamerule_local.num_skin)}
			instance_destroy(Gamerule_local.gem_board1[i,j])
		}
		else if Gamerule_local.gem_board1[i,j].gempower > 0 {fastness = 5; instance_destroy(Gamerule_local.gem_board1[i,j])}
	}
	j++
	alarm[1] = fastness
}
else alarm[0] = 1
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
	if instance_exists(Gamerule_1.gem_board1[i,j])
	{
		if Gamerule_1.gem_board1[i,j].amHype = true 
		{
			fastness = 60*4;
			with(Gamerule_1.gem_board1[i,j]) {skin_to_hype = irandom(Gamerule_1.num_skin)}
			instance_destroy(Gamerule_1.gem_board1[i,j])
		}
		else if Gamerule_1.gem_board1[i,j].gempower > 0 {fastness = 5; instance_destroy(Gamerule_1.gem_board1[i,j])}
		
		//else if Gamerule_1.gem_board1[i,j].amMulti = true {fastness = 5; instance_destroy(Gamerule_1.gem_board1[i,j])}
	}
	j++
	alarm[1] = fastness
}
else alarm[0] = 1
///@description make hidden gems on empty spots (used for challenge mode)
with(Gem_1)
{
	if amInvisible
	{
		instance_destroy()
		Gamerule_1.gem_board1[_i,_j] = noone
	}
}

with(Gamerule_1)
{
	{
		for(var i=7;i>=0;i--) //make board array empty
			{
				for(var j=7;j>=0;j--)
				{
					gem_board1[@i,j] = noone
					gemboard[@i,j] = -1
				}
			}
	}
	
	with(Gem_1) //fill it up with gems
	{
		if _i >= 0
		{
			other.gem_board1[@_i,_j] = id
			other.gemboard[@_i,_j] = skinnum
			if acc != 0 other.ready = false
		}
		else other.ready = false
	}
}
/*for (var i =0; i<8;i++)
{
	for (var j = 0; j<8; j++)
	{
		if Gamerule_1.gem_board1[i,j] != noone
		{
			if Gamerule_1.gem_board1[i,j].amInvisible
			{
				instance_destroy(Gamerule_1.gem_board1[i,j])
				Gamerule_1.gem_board1[i,j] = noone
			}
		}
	}
}*/
for (var j =0; j<8;j++)
{
	var stop = false
	for (var i = 0; i<8; i++)
	{
		if Gamerule_1.gem_board1[i,j] = noone
		{
			var gem = instance_create(Board_1.x + j*64, Board_1.y + i*64,Gem_1)
			gem.amInvisible = true
			with(gem) set_skin(7)
		}
		else stop = true
		if stop break;
	}
}
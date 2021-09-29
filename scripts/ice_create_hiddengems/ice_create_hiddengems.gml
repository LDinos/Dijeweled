///@description Create hidden gems below the ice gem
function ice_create_hiddengems() {
	var I = _i+1
	var J = _j
	var stop = false
	for(i=I; i< 8; i++)
	{
		if !stop
		{
			var gem = Gamerule_1.gem_board1[i,J]
			if instance_exists(gem)
			{
				if !gem.amInvisible
				{
					stop = true
				}
				else
				{
					with(gem) delete_gem()
				}
			}
			if !stop
			{
				var g = instance_create(Board_1.x + 64*J, Board_1.y + 64*i,Gem_1)
				Gamerule_1.gem_board1[i,J] = g
				Gamerule_1.gemboard[i,J] = 7
				ds_list_add(Gamerule_1.list_of_hiddengems, g)
				with(g)
				{
					amInvisible = true
					set_skin(7)
				}
			}
		}
		else break;
	}


}

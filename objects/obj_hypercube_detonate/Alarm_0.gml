/// @description Do create event here
var u = 0
make_gems_fallen(Gamerule_1)
//with(Gem_1)
//{

	for(var i = 0; i<8;i++)
	{
		for(var j=0;j<8;j++)
		{
			if Gamerule_1.gems_fallen[i,j] != noone
			{
				if index != 8 //case in which we destroy every gem (match together)
				{
					if index = 7 //dont destroy cubes/invs when hyping a coal
					{
						var am_hype = false
						with(Gamerule_1.gems_fallen[i,j]) {if amHype am_hype = true}
						
						
						if (Gamerule_1.gemboard[i,j] = index) && (!am_hype) && (!Gamerule_1.gems_fallen[i,j].amInvisible) 
						{
							gem[u] = Gamerule_1.gems_fallen[i,j]; 
							u++
						}
					}
					else
					{
						
						if (Gamerule_1.gemboard[i,j] = index) {
							gem[u++] = Gamerule_1.gems_fallen[i,j];
						}
					}
				}
				else 
				{
					if (!Gamerule_1.gems_fallen[i,j].amInvisible)
					{
						gem[u] = Gamerule_1.gems_fallen[i,j]; 
						u++
					}
				}
			}
		}
	}
//}
list_end = array_length_1d(gem)
alarm[1] = 1
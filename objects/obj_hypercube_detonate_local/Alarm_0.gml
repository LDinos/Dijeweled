/// @description Do create event here
var u = 0
make_gems_fallen(MyGamerule)
//with(Gem_1)
//{

	for(var i = 0; i<8;i++)
	{
		for(var j=0;j<8;j++)
		{
			if MyGamerule.gems_fallen[i,j] != noone
			{
				if index != 8 //case in which we destroy every gem (match together)
				{
					if index = 7 //dont destroy cubes/invs when hyping a coal
					{
						var am_hype = false
						with(MyGamerule.gems_fallen[i,j]) {if amHype am_hype = true}
						
						
						if (MyGamerule.gemboard[i,j] = index) && (!am_hype) && (!MyGamerule.gems_fallen[i,j].amInvisible) 
						{
							gem[u] = MyGamerule.gems_fallen[i,j]; 
							u++
						}
					}
					else
					{
						
						if (MyGamerule.gemboard[i,j] = index) {
							gem[u++] = MyGamerule.gems_fallen[i,j];
						}
					}
				}
				else 
				{
					if (!MyGamerule.gems_fallen[i,j].amInvisible)
					{
						gem[u] = MyGamerule.gems_fallen[i,j]; 
						u++
					}
				}
			}
		}
	}
//}
list_end = array_length_1d(gem)
alarm[1] = 1
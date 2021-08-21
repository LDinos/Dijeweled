/// @description A gem spawner for the avalanche gamemode
num_choices = ds_list_create()
showme = -1
havedone = false
#region make gems for first time
//1) create gems
for(var i=0;i<3;i++)
{
	for(var j=0;j<=7;j++)
	{
		gem_array[i,j] = irandom_range(0,Gamerule_1.num_skin)
	}
}

//2) make the Gem_1s not match

do
{
	var amready2 = false
	var amready = true
	for(var i=0;i<3;i++)
	{
		for(var j=0;j<=7;j++)
		{
			if i == 1
			{
				if (gem_array[i-1,j] == gem_array[i,j]) && (gem_array[i,j] == gem_array[i+1,j])
					{
						amready = false
						do gem_array[i,j] = irandom_range(0,Gamerule_1.num_skin)
						until gem_array[i,j] != gem_array[i-1,j]
					}
			}
			
			if j >= 1 && j <= 6
			{
				if (gem_array[i,j-1] == gem_array[i,j]) && (gem_array[i,j] == gem_array[i,j+1])
					{
						amready = false
						do gem_array[i,j] = irandom_range(0,Gamerule_1.num_skin)
						until gem_array[i,j] != gem_array[i,j-1]
					}
			}
			
			
		}
	}
	
	//3 always have moves at start
	if amready //&& global.board_rows = 3
		{
			#region Make sure we have moves to do
			for(var i = 0; i <3; i++)
			{			
				for(var j =0; j <8; j++)
				{
					//3
					if j < 5
					{
						if gem_array[i,j] == gem_array[i,j+2] && gem_array[i,j] == gem_array[i,j+3] && gem_array[i,j] != -1
						{
							amready2 = true //Yay! we have at least one move to do, we are done here
							break;
						}
					}				
					//4
					if j > 2
					{
						if gem_array[i,j] == gem_array[i,j-2] && gem_array[i,j] == gem_array[i,j-3] && gem_array[i,j] != -1
						{
							amready2 = true //Yay! we have at least one move to do, we are done here
							break;
						}
					}				
					//5
					if (j < 7 && i < 2 && i > 0)
					{
						if gem_array[i,j] == gem_array[i-1,j+1] && gem_array[i,j] == gem_array[i+1,j+1] && gem_array[i,j] != -1
						{
							amready2 = true //Yay! we have at least one move to do, we are done here
							break;
						}
					}				
					//6
					if (j > 0 && i < 2 && i > 0)
					{
						if gem_array[i,j] == gem_array[i-1,j-1] && gem_array[i,j] == gem_array[i+1,j-1] && gem_array[i,j] != -1
						{
							amready2 = true //Yay! we have at least one move to do, we are done here
							break;
						}
					}				
					//7
					if (i > 0 && j < 7 && j > 0)
					{
						if gem_array[i,j] == gem_array[i-1,j-1] && gem_array[i,j] == gem_array[i-1,j+1] && gem_array[i,j] != -1
						{
							amready2 = true //Yay! we have at least one move to do, we are done here
							break;
						}
					}
					//8
					if (i < 2 && j < 7 && j > 0)
					{
						if gem_array[i,j] == gem_array[i+1,j-1] && gem_array[i,j] == gem_array[i+1,j+1] && gem_array[i,j] != -1
						{
							amready2 = true //Yay! we have at least one move to do, we are done here
							break;
						}
					}
				}
				if amready2 break;
			}
			#endregion
			if !amready2 //4) shuffle and retry loop if we fail to find matches
				{
					for(i=0;i<3;i++)
					{
						for(j=0;j<=7;j++)
						{
							gem_array[i,j] = irandom_range(0,Gamerule_1.num_skin)
						}
					}
				}
		}
} until (amready = true) && (amready2 = true)


// and now spawn them in board1
for(var i=0;i<3;i++)
{
	for(var j=0;j<=7;j++)
	{
		my_x = Board_1.x + 64*j
		my_y = Board_1.y - 64*(i+1)
		my_skin = gem_array[i,j]
		Gem = instance_create_depth(my_x, my_y,-1,Gem_1)
		with(Gem)
		{
			set_skin(other.gem_array[i,j])
			if global.online
			{
				scr_add_gemid(Gamerule_1)
			}
		}

	}
}
#endregion
///@param board_array
///@param i_size
///@param j_size
///@description Algorithm that returns true if the board has possible matches or false if it doesnt.
var gem_array = argument0
var imax = argument1
var jmax = argument2
var amready2 = false
for(var i = 0; i <imax; i++)
{			
	for(var j =0; j <jmax; j++)
	{
		//1
		if i > 2
		{
			if gem_array[i,j] == gem_array[i-2,j] && gem_array[i,j] == gem_array[i-3,j] && gem_array[i,j] != -1
			{
				amready2 = true //Yay! we have at least one move to do, we are done here
				break;
			}
		}				
		//2
		if i < imax-4
		{
			if gem_array[i,j] == gem_array[i+2,j] && gem_array[i,j] == gem_array[i+3,j] && gem_array[i,j] != -1
			{
				amready2 = true //Yay! we have at least one move to do, we are done here
				break;
			}
		}
		//3
		if j < jmax-4
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
		if (j < jmax-1 && i < imax-1 && i > 0)
		{
			if gem_array[i,j] == gem_array[i-1,j+1] && gem_array[i,j] == gem_array[i+1,j+1] && gem_array[i,j] != -1
			{
				amready2 = true //Yay! we have at least one move to do, we are done here
				break;
			}
		}				
		//6
		if (j > 0 && i < imax-1 && i > 0)
		{
			if gem_array[i,j] == gem_array[i-1,j-1] && gem_array[i,j] == gem_array[i+1,j-1] && gem_array[i,j] != -1
			{
				amready2 = true //Yay! we have at least one move to do, we are done here
				break;
			}
		}				
		//7
		if (i > 0 && j < jmax-1 && j > 0)
		{
			if gem_array[i,j] == gem_array[i-1,j-1] && gem_array[i,j] == gem_array[i-1,j+1] && gem_array[i,j] != -1
			{
				amready2 = true //Yay! we have at least one move to do, we are done here
				break;
			}
		}
		//8
		if (i < imax-1 && j < jmax-1 && j > 0)
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

return amready2;
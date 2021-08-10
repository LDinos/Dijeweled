///@param list_moves_array
///@param INDEX
function do_virtual_match_twist(argument0, argument1) {
	var importance = 0;
	var list_moves = argument0
	var INDEX = argument1

	var i1 = list_moves[INDEX,0]
	var j1 = list_moves[INDEX,1]
	var dir = list_moves[INDEX,2]
	var gem1 = MyGamerule.gem_board1[i1,j1]
	var gem2 = MyGamerule.gem_board1[i1+1,j1]
	var gem3 = MyGamerule.gem_board1[i1,j1+1]
	var gem4 = MyGamerule.gem_board1[i1+1,j1+1]
	importance += find_power_importance(gem1.gempower)
	importance += find_power_importance(gem2.gempower)
	importance += find_power_importance(gem3.gempower)
	importance += find_power_importance(gem4.gempower)

	//if gem.amHype importance += 16 //hypercubes are as important as lightnings

	//if (importance == 0)
	{
		var virtual_board = MyGamerule.gemboard
		var virtual_board_gems = MyGamerule.gem_board1
	
		//1) virtual swap
		var temp = virtual_board[i1,j1]
		var temp_gem = virtual_board_gems[i1,j1]
		if dir == "cw" //clockwise
		{
			virtual_board[i1,j1] = virtual_board[i1+1,j1]
			virtual_board[i1+1,j1] = virtual_board[i1+1,j1+1]
			virtual_board[i1+1,j1+1] = virtual_board[i1,j1+1]
			virtual_board[i1,j1+1] = temp
		
			virtual_board_gems[i1,j1] = virtual_board_gems[i1+1,j1]
			virtual_board_gems[i1+1,j1] = virtual_board_gems[i1+1,j1+1]
			virtual_board_gems[i1+1,j1+1] = virtual_board_gems[i1,j1+1]
			virtual_board_gems[i1,j1+1] = temp_gem
		
		}
		else //counter clockwise
		{
			virtual_board[i1,j1] = virtual_board[i1,j1+1]
			virtual_board[i1,j1+1] = virtual_board[i1+1,j1+1]
			virtual_board[i1+1,j1+1] = virtual_board[i1+1,j1]
			virtual_board[i1+1,j1] = temp
		
			virtual_board_gems[i1,j1] = virtual_board_gems[i1,j1+1]
			virtual_board_gems[i1,j1+1] = virtual_board_gems[i1+1,j1+1]
			virtual_board_gems[i1+1,j1+1] = virtual_board_gems[i1+1,j1]
			virtual_board_gems[i1+1,j1] = temp_gem
		}
	
	
		//2) remove gems
		var n = 1
	
		//Horizontal
		var iend = i1+1
		var istart = i1
		for(var i = istart; i <= iend; i++)
		{
			n = 1
			var power_importance = 0;
			for( var j = 1; j < 8; j++)
			{
				if ((virtual_board[i,j] == virtual_board[i,j-1]) && (virtual_board[i,j] != -1))
				{
					power_importance += find_power_importance(virtual_board_gems[i,j].gempower)
					n++
				}
				else if n >= 3 {importance += n-2 + power_importance; n =1}
				else {n = 1; power_importance = 0;}
			}
			if n >= 3 {importance += n-2 + power_importance; n = 1}
			else {n = 1; power_importance = 0;}
		}
	
		//vertical
		var jend = j1+1
		var jstart = j1
		for(var j = jstart; j <= jend; j++)
		{
			n = 1
			var power_importance = 0;
			for( var i = 1; i < 8; i++)
			{
				if ((virtual_board[i,j] == virtual_board[i-1,j]) && (virtual_board[i,j] != -1))
				{
					power_importance += find_power_importance(virtual_board_gems[i,j].gempower)
					n++
				}
				else if n >= 3 {importance += n-2 + power_importance; n = 1}
				else {n = 1; power_importance = 0;}
			}
			if n >= 3 {importance += n-2 + power_importance; n = 1}
			else {n = 1; power_importance = 0;}
		}
	}

	return importance;


}

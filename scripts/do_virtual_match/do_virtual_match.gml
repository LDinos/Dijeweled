///@param list_moves_array
///@param INDEX
var importance = 0;
var list_moves = argument0
var INDEX = argument1

var i1 = list_moves[INDEX,0]
var j1 = list_moves[INDEX,1]
var dir = list_moves[INDEX,2]
var gem = MyGamerule.gem_board1[i1,j1]
importance += find_power_importance(gem.gempower)

if gem.amHype importance += 16 //hypercubes are as important as lightnings

if (importance == 0)
{
	var virtual_board = MyGamerule.gemboard
	var virtual_board_gems = MyGamerule.gem_board1
	var i2 = i1
	var j2 = j1
	switch dir
	{
		case "up":
			i2--
			break;
		case "down":
			i2++
			break;
		case "left":
			j2--
			break;
		case "right":
			j2++
			break;
	}
	//1) virtual swap
	var temp = virtual_board[i1,j1]
	virtual_board[i1,j1] = virtual_board[i2,j2]
	virtual_board[i2,j2] = temp
	var temp = virtual_board_gems[i1,j1]
	virtual_board_gems[i1,j1] = virtual_board_gems[i2,j2]
	virtual_board_gems[i2,j2] = temp
	
	//2) remove gems
	var n = 1
	
	//Horizontal
	var iend = i2
	var istart = i1
	if i1 > i2 {iend = i1; istart = i2}
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
	var jend = j2
	var jstart = j1
	if j1 > j2 {jend = j1; jstart = j2}
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
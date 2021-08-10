/// @description Insert description here
if obj_CUS_general.canclick
{
	var xx = x-32
	var yy = y-32

	var i = (mouse_y - yy) div 64
	var j = (mouse_x - xx) div 64

	if board[# i,j] != 8 && board[# i,j] != -1 && board[# i,j] != 7//if am not hype/coal
	{
		if (board[# i,j] < 60) board[# i,j] += 10
		else board[# i,j] = board[# i,j] mod 10 //remove powers
	}
}
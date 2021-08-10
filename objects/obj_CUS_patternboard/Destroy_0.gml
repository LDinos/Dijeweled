/// @description Insert description here
with(CUS_objective)
{
	if index == other.index
	{
		for(var i =0; i<8; i++)
		{
			for(var j =0; j<8; j++)
			{
				board[# i,j] = other.board[i,j]
			}
		}
	}
}
///@param Gamerule
function make_gems_fallen(argument0) {
	with(argument0)
	{
	
		gems_fallen = gem_board1
		for(var j=0;j<=7;j++)
		{
			var k = 7;
			for(var i=7;i>=0;i--)
			{
				if gem_board1[i,j] != noone
				{
					var temp = gems_fallen[k,j]
					var temp2 = gemboard[k,j]
					gems_fallen[k,j] = gem_board1[i,j]
					gems_fallen[i,j] = temp
					gemboard[k,j] = gemboard[i,j]
					gemboard[i,j] = temp2
					k--
				}
			}
		}
	}


}

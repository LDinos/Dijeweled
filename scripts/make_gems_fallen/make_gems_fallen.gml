///@param Gamerule
function make_gems_fallen(argument0) {
	with(argument0)
	{
		gems_fallen = gems_id_fallen_array
		for(var j=0;j<=7;j++)
		{
			var k = 7;
			for(var i=7;i>=0;i--)
			{
				if gems_id_fallen_array[i][j] != noone
				{
					var temp = gems_fallen[k,j]
					var temp2 = gems_skin_array[k,j]
					gems_fallen[k,j] = gems_id_fallen_array[i][j]
					gems_fallen[i][j] = temp
					gems_skin_array[k,j] = gems_skin_array[i][j]
					gems_skin_array[i][j] = temp2
					k--
				}
			}
		}
	}


}

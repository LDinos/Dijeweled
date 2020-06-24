///@param Gamerule
if global.online
{
	var i = 0;
	while( i < 64)
	{
		if argument0.GEM_ID[i] = -1
		{
			argument0.GEM_ID[i] = i
			myid = i
			break;
		}
		i++
	}
}
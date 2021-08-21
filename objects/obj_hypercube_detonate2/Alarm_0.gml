/// @description Insert description here
var u = 0
var s = skin_to_hype
switch s
{
	case 0: mycolor = c_red break;
	case 1: mycolor = c_white break;
	case 2: mycolor = c_green break;
	case 3: mycolor = c_yellow break;
	case 4: mycolor = c_purple break;
	case 5: mycolor = c_orange break;
	case 6: mycolor = c_blue break;
	default: mycolor = c_white break;
}
for(var i = 0; i <8; i++)
{
	for(var j = 0;j <8; j++)
	{
		gem2_array[i,j] = -1
	}
}
with(Gem_2)
{
	if _i >= 0
		{
			other.gem2_array[@_i,_j] = skinnum
			if s != 8
			{
				if s != 7
				{
					if (skinnum == s) {other.gem[u,0] = x; other.gem[u,1] = y; u++}
				}
				else
				{
					if (skinnum == s) && (!amHype) && (!amInvisible)
					{
						other.gem[u,0] = x; other.gem[u,1] = y; u++
					}
				}
			}
			else
			{
				if !amInvisible
				{
					other.gem[u,0] = x; other.gem[u,1] = y; u++
				}
			}
		}
}

list_end = u
alarm[1] = 1
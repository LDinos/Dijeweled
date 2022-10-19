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

with(Gem_2)
{
	var p_id = global.spectator ? other.player_id : 0
	if (player_id == p_id) {
	if _i >= 0
		{
			if s != 8
			{
				if s != 7
				{
					if (skinnum == s) {
						other.gem[u,0] = x; other.gem[u,1] = y; u++
					} 
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
}

list_end = u
alarm[1] = 1
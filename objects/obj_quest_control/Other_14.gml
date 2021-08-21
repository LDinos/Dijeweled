/// @description Find number of things
// You can write your code in this editor
	S_num_red = 0
	S_num_coals = 0
	S_num_green = 0
	S_num_orange = 0
	S_num_blue = 0
	S_num_white = 0
	S_num_yellow = 0
	S_num_purple = 0
	S_num_fruits = 0
for(var i = 0 ; i<8; i++)
{
	for(var j=0;j<8;j++)
	{
		var skin = Gamerule_1.gemboard[i,j]
		switch skin
		{
			case -1: break;
			case 0: S_num_red++ break;
			case 1: S_num_white++ break;
			case 2: S_num_green++ break;
			case 3: S_num_yellow++ break;
			case 4: S_num_purple++ break;
			case 5: S_num_orange++ break;
			case 6: S_num_blue++ break;
			case 7: if Gamerule_1.gem_board1[i,j] != noone
					{
						if (Gamerule_1.gem_board1[i,j].amLocked = 0 && !Gamerule_1.gem_board1[i,j].amHype) S_num_coals++ 	
					}
					break;			
		}
	}
}

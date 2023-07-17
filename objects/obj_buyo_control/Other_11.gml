/// @description MOVE
	audio_play_sound(snd_buyo_move,0,0)
	var condition = (_j < 7 && _j2 < 7)
	var x_dif = 64
		if left
		{
			condition = (_j > 0 && _j2 > 0)
			x_dif = -64
		}
		
		if condition //check if we are on the edges first
		{
			var j_temp = (x+x_dif-Board_1.x+63) div 64 //returns 0-7 grid index (collumn)
			var j_temp2 = (x+xx+x_dif-Board_1.x+63) div 64 //returns 0-7 grid index (collumn)
			var cond1 = true
			var cond2 = true
			if _i >= 0 cond1 = (Gamerule_1.gem_board1[_i,j_temp] == noone)
			if _i2 >= 0 cond2 = (Gamerule_1.gem_board1[_i2,j_temp2] == noone)
			if  cond1 && cond2 //if nothing blocks us
			{
				x += x_dif
				scr_buyo_findij()
				//reset spd
				/*if _i >= 0
				{
					if (_i == 7) alarm[0] = spd
					else if (Gamerule_1.gem_board1[_i+1,_j] != noone) alarm[0] = spd
				}
				else if _i2 >= 0
				{
					if (_i2 == 7) alarm[0] = spd
					else if (Gamerule_1.gem_board1[_i2+1,_j2] != noone) alarm[0] = spd
				}*/
			}
		}	
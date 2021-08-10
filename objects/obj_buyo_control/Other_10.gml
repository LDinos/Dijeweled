/// @description ROTATE
//CC
		audio_play_sound(snd_buyo_rot,0,0)
		//alarm[0] = spd
		var ang = 90;
		var cond_angle = 270
		var else_angle = 0
		
		if (keyboard_lastkey == vk_up) || gamepad_lastkey(global.gp[0]) == gp_face1 || gamepad_lastkey(global.gp[0]) == gp_face2//C
		{
			var ang = -90;
			var cond_angle = 0
			var else_angle = 270
		}
	
		if image_angle != cond_angle image_angle += ang
		else image_angle = else_angle
	
		#region find xx,yy
			switch (image_angle)
			{
				case 0:
					xx = 0 //x for second gem. Changes on rotation
					yy = -64 //y for second gem. Changes on rotation
					break;
				case 270:
					xx = 64 //x for second gem. Changes on rotation
					yy = 0//y for second gem. Changes on rotation
					break;
				case 180:
					xx = 0 //x for second gem. Changes on rotation
					yy = 64//y for second gem. Changes on rotation
					break;
				case 90:
					xx = -64 //x for second gem. Changes on rotation
					yy = 0//y for second gem. Changes on rotation
					break;
			}
		#endregion
		scr_buyo_findij()
		
		if image_angle = 0 || image_angle = 180 //gems are vertical
		{
			if _i2 > 7
			{
				y-=64
				//alarm[0] = spd
			}
			else if _i2 >= 0
			{
				if Gamerule_1.gem_board1[_i2,_j2] != noone
				{
					y-=64
					//alarm[0] = spd
				}
			}
			scr_buyo_findij()
		}
		else //we made a horizontal rotation
		{
			var doit = false
			var doit2 = false
			var movex = 64
			if (_j2 > 7 || _j2 < 0)
			{
				if _j2 > 7
				{
					movex = -64
					if _i2 >= 0 && _i >= 0
					{
						if Gamerule_1.gem_board1[_i,_j-1] == noone
						{
							doit2 = true
						}
						else doit = true
					}
					else doit2 = true
				}
				else if _j2 < 0
				{
					if _i2 >= 0 && _i >= 0
					{
						if Gamerule_1.gem_board1[_i,_j+1] == noone
						{
							doit2 = true
						}
						else doit = true
					}
					else doit2 = true
				}
				

			}
			else if _i2 < 0 doit = false
			else if (Gamerule_1.gem_board1[_i2,_j2] != noone) doit = true
			
			if doit //return to previous rotation
			{
				event_user(0)
			}
			else if doit2 
			{
				x += movex
				scr_buyo_findij()
			}
		}
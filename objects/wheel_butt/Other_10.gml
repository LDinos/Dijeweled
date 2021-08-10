///CONDITIONS
/*
DANGER LVL 1:	WIN -> 0
					-> 45
					-> 135					
				LOSS-> 90
				
DANGER LVL 2:	WIN -> 0
					-> 135
				LOSS-> 90
					-> 45
					
DANGER LVL 3:	WIN -> 0
				LOSS-> 90
					-> 45
					-> 135
		
*/
if clicked = 0
    {
        clicked = 1
        image_alpha = 0
        with (wheel_spinner)
        {
			acc = maxacc
            if !alreadydone
            {
                if acc >= maxacc //8
                {
                audio_play_sound(timpani,0,0)
                audio_stop_sound(tick)
				
				#region Determine where we fall depending if we need to lose or win!
				    var addmore = 8
					if Gamerule_1.isReplay addmore = 0
					var alarm_index = 1;
					var future_rot = rot + 96+addmore //96 is the angle it completes when deaccelerating + 8 after doing alarm = 1
					if future_rot >= 180 future_rot -= 180


					switch Gamerule_1.bomb_danger
					{
						case 1:
							if !Gamerule_1.bomb_win
							{	//DANGER 1 LOSS
								while(future_rot <= 67.5 || future_rot > 112.5) //68.5, 112
								{
									alarm_index++
									future_rot += 8
									if future_rot >= 180 future_rot -= 180
								}
							}
							else //DANGER 1 WIN
							{
								while(future_rot > 67.5 && future_rot <= 112.5) //68.5, 112
								{
									alarm_index++
									future_rot += 8
									if future_rot >= 180 future_rot -= 180
								}
							}
						break;
						
						case 2:
							if !Gamerule_1.bomb_win
							{//DANGER 2 LOSS
								while(future_rot <= 22.5 || future_rot > 112.5) //22.5, 112
								{
									alarm_index++
									future_rot += 8
									if future_rot >= 180 future_rot -= 180
								}
							}
							else //DANGER 2 WIN
							{
								while(future_rot > 22.5 && future_rot <= 112.5) //22.5, 112
								{
									alarm_index++
									future_rot += 8
									if future_rot >= 180 future_rot -= 180
								}
							}
						break;
						
						default:
							if !Gamerule_1.bomb_win
							{//DANGER 3 LOSS
								while(future_rot <= 22.5 || future_rot > 157.5) //22.5, 157.5
								{
									alarm_index++
									future_rot += 8
									if future_rot >= 180 future_rot -= 180
								}
							}
							else //DANGER 3 WIN
							{
								while(future_rot > 22.5 && future_rot <= 157.5) //22.5, 157.5
								{
									alarm_index++
									future_rot += 8
									if future_rot >= 180 future_rot -= 180
								}
							}
						break;
						
						
					}

				#endregion
				alarm[3] = alarm_index
				//======================\\
				wheel_spinner.texttowrite = future_rot
                alreadydone = true
                }
            }
        }
    }


/// @description Insert description here
var m = 512
draw_set_font(font2)
draw_set_halign(fa_left)
draw_text(8,16+m,string(floor(fps_real)) + " FPS")
draw_text(8,48+m,"LAG " + string(lagness))
//draw_text(8,32+m,cur_time)
//draw_text(8,76+m,IsGemActive)
//for(i=0;i<ds_list_size(list_of_skulls);i++) draw_text(8,48+m + 16*i,list_of_skulls[| i])
//for(i=0;i<8;i++) draw_text(8,48+m + 16*i,gaps[i])

#region draw gem_board1[i,j]
/*
for(i=0;i<=7;i++)
{
	for(j=0;j<=7;j++)
	{
		if gem_board1[i,j] != noone
		{
			switch gem_board1[i,j].skinnum
			{
				case 0:
					color = c_red
					break;
				case 1:
					color = c_white
					break;
				case 2:
					color = c_green
					break;
				case 3:
					color = c_yellow
					break;
				case 4:
					color = c_purple
					break;
				case 5:
					color = c_orange
					break;
				case 6:
					color = c_blue
					break;
				default:
					color = c_black
					break;
			}
		}
		else color = c_black
		draw_circle_color(Board_1.x - 256 + 32*j, (Board_1.y-512+256+m) + 32*i, 4,color,color,false)
		//draw_text(Board_1.x + 32*j, (Board_1.y+256) + 32*i, gemboard[i,j])
	}
}*/
#endregion

#region draw gemboard[i,j]
if debug
{
for(i=0;i<=7;i++)
{
	for(j=0;j<=7;j++)
	{
		switch gemboard[@i,j]
		{
			case 0:
				color = c_red
				break;
			case 1:
				color = c_white
				break;
			case 2:
				color = c_green
				break;
			case 3:
				color = c_yellow
				break;
			case 4:
				color = c_purple
				break;
			case 5:
				color = c_orange
				break;
			case 6:
				color = c_blue
				break;
			case 7:
				color = c_aqua
				break;
			default:
				//if this appears, u fucked something up
				color = c_black
				break;
		}
		if gemboard[i,j] != -1 draw_circle_color(Board_1.x - 256 + 32*j, (Board_1.y-512+256+m) + 32*i, 4,color,color,false)
		//draw_text(Board_1.x + 32*j, (Board_1.y+256+m) + 32*i, gemboard[i,j])
		
	}
}
}
#endregion
//draw_text(x,y,summoves2)
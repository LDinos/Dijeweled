/// @description Insert description here
var m = 512
draw_set_font(font2)
draw_set_halign(fa_left)
draw_text(8,16+m,string(floor(fps_real)) + " FPS")
draw_text(8,48+m,"LAG " + string(lagness))
if debug {
draw_text(8,72+m,string(gems_ready))
draw_text(8,86+m,string(IsGemActive))
draw_text(8,100+m,string(IsGemActive2))
}
#region draw gems_id_fallen_array[i][j]
/*
for(i=0;i<=7;i++)
{
	for(j=0;j<=7;j++)
	{
		if gems_id_fallen_array[i][j] != noone
		{
			switch gems_id_fallen_array[i][j].skinnum
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
		//draw_text(Board_1.x + 32*j, (Board_1.y+256) + 32*i, gems_skin_array[i][j])
	}
}*/
#endregion
/*
#region draw gems_skin_array[i][j]
if debug
{
for(var i=0;i<=7;i++)
{
	for(var j=0;j<=7;j++)
	{
		if gems_id_array[i][j] != noone { 
			var g = gems_id_array[i][j].skinnum
			switch g
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
			draw_circle_color(Board_1.x - 256 + 32*j, (Board_1.y-512+256+m) + 32*i, 4,color,color,false)
			//draw_text(Board_1.x + 32*j, (Board_1.y+256+m) + 32*i, gems_skin_array[i][j])
		}	
	}
}
}
#endregion

/// @description Insert description here
if !unable
{
	click = -1
	if (mouse_x <= x+784 && mouse_x >= x+784 - 6*16)
	{
		if mouse_y >= y+208 && mouse_y<= y+208+16
		{
			click = 0
		}
		else if mouse_y >= y+208+16*1+8*1 && mouse_y<= y+208+16+16*1+8*1
		{
			click = 1
		}
		else if mouse_y >= y+208+ 16*2+8*2 && mouse_y<= y+208+16+ 16*2+8*2
		{
			click = 2
		}
		else if mouse_y >= y+208+ 16*3+8*3 && mouse_y<= y+208+16+ 16*3+8*3
		{
			click = 3
		}
		else if mouse_y >= y+208+ 16*4+8*4 && mouse_y<= y+208+16+ 16*4+8*4
		{
			click = 4
		}
		else if mouse_y >= y+208+ 16*5+8*5 && mouse_y<= y+208+16+ 16*5+8*5
		{
			click = 5
		}
		else if mouse_y >= y+208+ 16*6+8*6 && mouse_y<= y+208+16+ 16*6+8*6
		{
			click = 6
		}
		else if mouse_y >= y+208+ 16*7+8*7 && mouse_y<= y+208+16+ 16*7+8*7
		{
			click = 7
		}
		else if mouse_y >= y+208+ 16*8+8*8 && mouse_y<= y+208+16+ 16*8+8*8
		{
			click = 8
		}
		else if mouse_y >= y+208+ 16*9+8*9 && mouse_y<= y+208+16+ 16*9+8*9
		{
			click = 9
		}
	
		if click != -1 //if we clicked on something
		{
			unable = true
		}
	}
}
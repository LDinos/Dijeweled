/// @description Insert description here
centerize_text()
draw_sprite_ext(spr_black,0,0,0,room_width,room_height,0,c_white,0.9)
draw_text_outline(x-32 + sprite_width/2,y-64,"Customize PATTERN BOARD",c_white,c_black)
draw_self()
for (var i = 0; i < 8; i++) 
{
    for (var j = 0; j < 8; j++) 
	{
		if board[i,j] != -1
		{
			var spr = board[i,j] mod 10
			draw_sprite(spr_gems_small,spr,x + j*64,y +i*64)
		}
	}
}
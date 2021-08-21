/// @description Insert description here
draw_set_font(font0)
centerize_text()
draw_self()
for (var i = 0; i < 8; i++) 
{
    for (var j = 0; j < 8; j++) 
	{
		if board[# i,j] != -1
		{
			var spr = board[# i,j] mod 10
			var pow = board[# i,j] div 10
			if pow > 0 && pow < 6 
			{
				draw_sprite(spr_cus_powers,pow-1,x + j*64,y +i*64)
			}
			if pow != 6 draw_sprite(spr_gems_small,spr,x + j*64,y +i*64)
			else draw_sprite_ext(spr_fruits,spr,x + j*64,y +i*64,0.5,0.5,0,c_white,1)
			if pow = 7 draw_sprite(spr_lockgem,0,x + j*64,y +i*64)
		}
	}
}
if allowed draw_text_outline(x-32 + sprite_width/2,y+256-32,"You can edit the Board if GEM SPAWN is DISABLED",c_red,c_black)
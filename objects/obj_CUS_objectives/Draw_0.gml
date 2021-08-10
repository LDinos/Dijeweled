/// @description Insert description here
draw_self()
//draw_text(x,y,objectives)
for(var i=0; i<= objectives; i++)
{
	if i <= 3
	{
		draw_sprite(spr_obj_bot,0,x,y+32 + i*5*16)
	}
}
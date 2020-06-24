/// @description Insert description here
draw_rectangle_monocolor(x,y,x+width,y+height,LIGHT_GRAY,false)
draw_rectangle_monocolor(x,y,x+width,y+4*16,BLACK_GRAY,false)
centerize_text()
draw_set_font(font0)
if !global.bot1
{
	draw_text_outline(x + width/2,y+32,"Player 2 Controller",c_white,c_black)
	draw_text_outline(x + width/2,y+height/2+32,options[index,1],c_white,c_black)
}
else
{
	draw_text_outline(x + width/2,y+32,"Bot Difficulty",c_white,c_black)
	draw_text_outline(x + width/2,y+height/2+32,options_bot[index],c_white,c_black)
}
if hover draw_sprite_ext(spr_black,1,x,y,width,height,0,c_white,0.3)
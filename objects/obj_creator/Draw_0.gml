/// @description Insert description here
draw_set_font(font0)
draw_set_halign(fa_right)
if global.creator != "-"
{
	//draw_text_outline(x,y,"Made by: " + global.creator,c_white,c_black)
	draw_text_outline_transformed(x,y,"Made by: " + global.creator,c_white,c_black,0.5)
}
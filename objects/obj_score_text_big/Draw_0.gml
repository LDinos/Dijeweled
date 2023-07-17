/// @description Insert description here
color = make_color_hsv(index,255,255)
centerize_text()
draw_set_font(fnt_score_text_big)
if text > 0
{
	draw_text_transformed_color(x-1,y,text,scale,scale,0,c_black,c_black,c_black,c_black,0.25)
	draw_text_transformed_color(x+1,y,text,scale,scale,0,c_black,c_black,c_black,c_black,0.25)
	draw_text_transformed_color(x,y-1,text,scale,scale,0,c_black,c_black,c_black,c_black,0.25)
	draw_text_transformed_color(x,y+1,text,scale,scale,0,c_black,c_black,c_black,c_black,0.25)
	draw_text_transformed_color(x,y,text,scale,scale,0,color,color,color,color,1)
}
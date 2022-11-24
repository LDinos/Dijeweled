/// @description Insert description here
var t = number_convert_with_commas(text)
centerize_text()
draw_set_font(fnt_score_text)
draw_text_transformed_color(x-1,y,t,scale*0.8,scale*0.8,0,c_black,c_black,c_black,c_black,0.5)
draw_text_transformed_color(x+1,y,t,scale*0.8,scale*0.8,0,c_black,c_black,c_black,c_black,0.5)
draw_text_transformed_color(x,y-1,t,scale*0.8,scale*0.8,0,c_black,c_black,c_black,c_black,0.5)
draw_text_transformed_color(x,y+1,t,scale*0.8,scale*0.8,0,c_black,c_black,c_black,c_black,0.5)
draw_text_transformed_color(x,y,t,scale*0.8,scale*0.8,0,color,color,color,color,1)
/// @description Insert description here
centerize_text()
draw_set_font(fnt_score_text)
draw_text_transformed_color(x-1,y,text,scale*0.8,scale*0.8,0,c_black,c_black,c_black,c_black,0.5)
draw_text_transformed_color(x+1,y,text,scale*0.8,scale*0.8,0,c_black,c_black,c_black,c_black,0.5)
draw_text_transformed_color(x,y-1,text,scale*0.8,scale*0.8,0,c_black,c_black,c_black,c_black,0.5)
draw_text_transformed_color(x,y+1,text,scale*0.8,scale*0.8,0,c_black,c_black,c_black,c_black,0.5)
draw_text_transformed_color(x,y,text,scale*0.8,scale*0.8,0,color,color,color,color,1)
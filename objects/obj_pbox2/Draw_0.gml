/// @description Insert description here
// You can write your code in this editor
draw_self()
draw_set_font(font0)
draw_set_halign(fa_center)
draw_set_valign(fa_middle)
if length > 5 draw_text_transformed(x,y,text,7/length,7/length,0)
else draw_text_transformed(x,y,text,6/7,6/7,0)
/// @description Insert description here
draw_set_font(font0)
draw_self()
if hover draw_sprite(spr_lob_glow3,0,x,y)
draw_set_halign(fa_center)
draw_set_valign(fa_middle)
draw_text_transformed_color(x,y,choice[val],0.75,0.75,0,c_yellow,c_yellow,c_yellow,c_yellow,1)




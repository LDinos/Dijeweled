/// @description Insert description here
draw_set_font(font0)
draw_self()
if hover draw_sprite(spr_lob_glow2,0,x,y)
draw_set_halign(fa_left)
draw_set_valign(fa_middle)
draw_text_transformed(x+16+margin,y+8,"Skin number",0.5,0.5,0)
draw_set_halign(fa_center)
draw_text_transformed(x+8,y+8,string(val),0.5,0.5,0)



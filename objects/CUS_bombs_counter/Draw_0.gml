/// @description Insert description here
draw_self()
draw_set_halign(fa_left)
draw_set_valign(fa_middle)
draw_text_transformed(x+32+margin,y+8,"Bomb Counter",0.5,0.5,0)
draw_set_halign(fa_center)
draw_text_transformed(x+16,y+8,value + flick,0.5,0.5,0)

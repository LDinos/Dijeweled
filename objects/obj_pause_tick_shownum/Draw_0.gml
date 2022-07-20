/// @description Insert description here
draw_self()
if (hover) draw_sprite_ext(spr_black, 1, x, y, sprite_width, sprite_height, 0, c_white, 0.4)
draw_set_font(font0)
draw_set_halign(fa_left)
draw_set_valign(fa_top)
draw_text(x+sprite_width+8,y,"Show score numbers")
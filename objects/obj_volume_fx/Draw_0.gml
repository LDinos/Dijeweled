/// @description Insert description here
draw_self()

draw_sprite_part(spr_volume_white,0,0,0,sprite_width*global.VolFX,sprite_height,x,y)

var xtouse = x + sprite_width*global.VolFX
draw_sprite(spr_volume_bar,0,xtouse,y)

draw_set_valign(fa_middle)
draw_set_halign(fa_right)
draw_text_transformed(x-8,y+16,"FX",.8,.8,0)
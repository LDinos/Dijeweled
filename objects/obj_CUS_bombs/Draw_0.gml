/// @description Insert description here
draw_self()
draw_set_font(font0)
draw_set_halign(fa_left)
draw_set_valign(fa_center)
draw_text_transformed(x+32,y+16,"Allow Bombs",0.8,0.8,0)
if enabled
{
	draw_sprite(spr_check,0,x+8,y+8)
	draw_sprite(spr_generic_bot,0,x,y+32)
	draw_sprite(spr_generic_bot,0,x,y+64)
	draw_sprite(spr_generic_bot,0,x,y+96)
}
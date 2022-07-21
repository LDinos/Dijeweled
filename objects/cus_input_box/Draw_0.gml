/// @description Insert description here
draw_set_halign(fa_center)
draw_set_valign(fa_middle)
if (box_type == BOX_TYPE_NUM) {
	draw_self()
	draw_text_transformed(x + sprite_width/2,y+8,value,0.5,0.5,0)
}
else draw_sprite(sprite_index, value, x, y)

draw_set_halign(fa_left)
draw_text_transformed(x + sprite_width + margin, y+8, description, 0.5,0.5,0)


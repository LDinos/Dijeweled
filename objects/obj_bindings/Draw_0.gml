/// @description Insert description here
//draw_self()
draw_pause(true)
draw_set_font(font0)
draw_set_valign(fa_top)
for(var i = 0; i < 10; i++)
{
	draw_sprite(spr_bindings,0,x+784,y+208 +16*i +8*i)
	if (hover == i) draw_sprite_ext(spr_black, 1, x+784 - sprite_get_width(spr_bindings),y+208 +16*i +8*i, sprite_get_width(spr_bindings), sprite_get_height(spr_bindings), 0, c_white, 0.4)
}

for(var i = 0; i < 10; i++)
{
	draw_set_halign(fa_left)
	draw_text_transformed(x+496,y+208 + 16*i +8*i,B_list[i,1],.5,.5,0)
	draw_set_halign(fa_center)
	draw_text_transformed(x+784 - 3*16,y+208 + 16*i +8*i,B_names[B_list[i,0] - n],.5,.5,0)
}
if unable draw_text(x+654,y+528-32,"Press a button for " + B_list[click,1])
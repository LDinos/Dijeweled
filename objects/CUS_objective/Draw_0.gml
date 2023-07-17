/// @description Insert description here
draw_self()
if image_index = 2
{
	draw_set_halign(fa_left)
	draw_set_valign(fa_middle)
	draw_text_transformed(x + 16,y + sprite_height/2,text,.8,.8,0)
	draw_sprite(spr_pencil,hover,x,y)
}
else if hasinput
{
	draw_set_halign(fa_left)
	draw_set_valign(fa_middle)
	draw_text_transformed(x + 48+24,y + sprite_height/2,text,.6,.6,0)
	draw_sprite(spr_num_input,0,x,y+32)
	draw_sprite(spr_num_input,0,x+32,y+32)
	
	centerize_text()
	draw_text_transformed(x+32,y+40,text2 + blink,0.5,0.5,0)
}
else if hastickbox
{
	centerize_text()
	draw_text_transformed(x + sprite_width/2,y + sprite_height/2 - 24,text,.8,.8,0)
	draw_set_halign(fa_left)
	draw_sprite(spr_blackcheck,amticked,x+8,y+ sprite_height/2 + 8)
	draw_text_transformed(x + 32,y + sprite_height/2 + 16,texttickbox,.6,.6,0)
}
else
{
	centerize_text()
	draw_text_transformed(x + sprite_width/2,y + sprite_height/2,text,.8,.8,0)
}
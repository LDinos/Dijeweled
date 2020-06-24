/// @description Insert description here
draw_self()
draw_set_font(fnt_chat)
draw_set_halign(fa_left)
draw_set_valign(fa_center)
draw_text(x,y,text + blink)
draw_set_halign(fa_left)
draw_set_valign(fa_top)
for(var i =0; i < ds_list_size(log);i++)
{
	var col = colorlog[| i]
	draw_text_color(x,y-16+(16*(i-11)) ,log[| i],col,col,col,col,1)
}
draw_set_font(font0)
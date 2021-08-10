/// @description Insert description here
// You can write your code in this editor
centerize_text()
draw_set_font(font0)
draw_self()
for(var i = 0; i <27;i++) draw_text(x + 24 + i*48,y+24,string(i+1))
draw_sprite(spr_topglow,0, dist,y)
draw_text_outline(room_width/2,72,AR_titles[index],c_white,c_black)
if (index == 26)
{
	draw_sprite(spr_scrollbase,0,0,0)
	draw_text_transformed(room_width - 72,room_height - 48,"Page: " + string(page+1), 0.8,0.8,0)
}
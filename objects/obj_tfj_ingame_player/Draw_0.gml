draw_self()
var c= c_black
draw_text_color(x+sprite_width/2,y-font_get_size(font0)/2,name + "-" + string(placement) + "-" + string(_score) + "-" + string(gold)+"$",c,c,c,c,1)
draw_text_color(x+sprite_width/2,y+sprite_height/2,hp,c,c,c,c,1)

for (var i=0;i<array_length(cards);i++)
{
	draw_text_color(x+sprite_width+16+100*i,y+sprite_height/2,cards[i]==undefined?"":cards[i],c,c,c,c,1)
}


/// @description Insert description here
draw_set_font(font0)
draw_replaylist()
//draw_self()
if !empty
{
	for (var i = 0 +15*(page-1); i<15+15*(page-1); i++)
	{
		if array_length(mystring) - 1 >= i
		{
			var _score = is_real(myscore[i]) ? number_convert_with_commas(myscore[i]) : myscore[i]
			draw_set_halign(fa_left)
			draw_text_transformed(x+32+4,y+144+32*(i mod 15),mytitle[i],.75,.75,0)
			centerize_text()
			draw_text_transformed(x+16,y+144+32*(i mod 15),string(i+1),.75,.75,0)
			draw_text_transformed(x+463,y+144+32*(i mod 15),mytime[i],.75,.75,0)
			draw_text_transformed(x+568,y+144+32*(i mod 15),_score,.75,.75,0)
			draw_text_transformed(x+688,y+144+32*(i mod 15),mydate[i],.75,.75,0)
		}
	}
}
if (meet > - 1)
{
	draw_sprite(spr_replaysave_glow,0,x,y+128 + (meet*32) mod 480)
	draw_sprite(spr_trash,0,x,y+128 + (meet*32) mod 480)
}
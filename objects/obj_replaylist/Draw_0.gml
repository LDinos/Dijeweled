/// @description Insert description here
draw_set_font(font0)
draw_replaylist()
var p = (list_type == list_types.PUBLISHED) ? 0 : (page-1)
//draw_self()
if !empty
{
	for (var i = 0 +15*(p); i<15+15*(p); i++)
	{
		if array_length(mystring) - 1 >= i
		{
			var _score = is_real(myscore[i]) ? number_convert_with_commas(myscore[i]) : myscore[i]
			var box_w = 96
			var default_scale = 0.75
			var text_width = string_width(_score);
			
			// Calculate required scale ---
			var scale = default_scale;

			// Only shrink if it doesn't fit horizontally
			if (text_width * default_scale > box_w) {
			    scale = (box_w / text_width); // Scale down to fit exactly
			}
			
			draw_set_halign(fa_left)
			draw_text_transformed(x+32+4,y+144+32*(i mod 15),mytitle[i],.75,.75,0)
			centerize_text()
			draw_text_transformed(x+16,y+144+32*(i mod 15),string(i+1),.75,.75,0)
			draw_text_transformed(x+463,y+144+32*(i mod 15),mytime[i],.75,.75,0)
			draw_text_transformed(x+568,y+144+32*(i mod 15),_score,scale,scale,0)
			draw_text_transformed(x+688,y+144+32*(i mod 15),mydate[i],.75,.75,0)
		}
	}
}
if (meet > - 1)
{
	draw_sprite(spr_replaysave_glow,0,x,y+128 + (meet*32) mod 480)
	if (list_type != list_types.PUBLISHED) draw_sprite(spr_trash,0,x,y+128 + (meet*32) mod 480)
}
if (selected > -1 && page == selected_page && selected_list == list_type) {
	draw_sprite(spr_replaysave_glow,0,x,y+128 + (selected*32) mod 480)
}
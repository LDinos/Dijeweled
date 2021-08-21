if ready && global.ShowScore
{
//draw_set_alpha(0.7)
draw_set_font(Typo_Grotesk)
draw_set_halign(fa_center)
draw_set_colour(color1)
draw_text_transformed(x,y,string_hash_to_newline(string(myscore)),image_xscale/mysize,image_xscale/mysize,0)
draw_set_colour(color2)
draw_text_transformed(x,y,string_hash_to_newline(string(myscore)),(image_xscale-0.1)/mysize,(image_xscale-0.1)/mysize,0)
draw_set_colour(c_white)

draw_text_transformed(x,y,string_hash_to_newline(string(myscore)),(image_xscale-0.2)/mysize,(image_xscale-0.2)/mysize,0)
//draw_set_alpha(1)
}


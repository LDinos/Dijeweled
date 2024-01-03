/// @description
var c = c_white
var logo_x = room_width/2
var text_x = room_width/2
var text_y = room_height - 32
var glow_x = current_glow_x - glow_width
draw_sprite_ext(spr_logo, 0, logo_x, logo_current_y, 0.4, 0.4, 0, c, logo_alpha)
draw_set_blend_mode(bm_add)
	draw_sprite_part_ext(spr_logo, 0,
	glow_x,0,glow_width,sprite_get_height(spr_logo),
	logo_x - (sprite_get_width(spr_logo)/2)*0.4 + glow_x*0.4, logo_current_y,0.4, 0.4, c, logo_alpha)
	draw_sprite_ext(spr_logo, 0, logo_x, logo_current_y, 0.4, 0.4, 0, c, steady_glow_alpha)
draw_set_blend_mode(bm_normal)
draw_set_font(font0)
centerize_text()
draw_text_outline_alpha(text_x, text_y, text, c, c_black, text_alpha)
draw_text_outline_alpha(room_width/2, 2*room_height/3 , "Press anywhere to Play", c, c_black, text_alpha)










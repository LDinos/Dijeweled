draw_set_blend_mode(bm_add)
draw_sprite_ext(sprite_index,image_index,x,y,image_xscale,image_yscale,image_angle,c_white,base_alpha)
draw_sprite_ext(lightningglow,image_index,x,y,0.5,0.6,image_angle,color,glowalpha*base_alpha)
draw_set_blend_mode(bm_normal)


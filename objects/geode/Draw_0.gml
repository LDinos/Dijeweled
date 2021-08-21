//draw_sprite_ext(sprite_index,2,x,y,.5,.5,angle,c_white,0.3) //blackness
//draw_sprite_ext(sprite_index,3,x,y,1,1,angle,c_white,1) //
draw_sprite_ext(sprite_index,0,x,y,scale,scale,angle,c_white,1) //smoky white photon
draw_sprite_ext(sprite_index,1,x,y,scale,scale,angle,c_white,1) //photon with rays
draw_set_blend_mode(bm_add)
draw_sprite_ext(spr_geode,0,x,y,scale,scale,angle1+angle,c_white,0.3)
draw_sprite_ext(spr_geode,0,x,y,scale,scale,angle2+angle,c_white,0.3)
draw_set_blend_mode(bm_normal)

draw_sprite_ext(sprite_index,0,x,y,xscale,xscale,rot,c_white,1)
draw_sprite_ext(sprite_index,1,x,y,xscale,xscale,rot,c_white,clamp(dsin(current_time * 0.36),0,1))
if instance_exists(mygem)
{
//draw_set_blend_mode(bm_add)
draw_sprite_ext(redglow,0,x,y,1,1,0,c_white,alpha)
//draw_set_blend_mode(bm_normal)
}


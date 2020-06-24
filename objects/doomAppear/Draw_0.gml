draw_sprite_ext(sprite_index,image_index,x,y,xscale,xscale,rot,c_white,1)
if instance_exists(mygem)
{
draw_set_blend_mode(bm_add)
var temp_alpha = draw_get_alpha();
draw_set_alpha(alpha)
draw_rectangle_color(x-32,y-32,x+32,y+32,192,192,192,192,0);
//draw_sprite_ext(redglow,0,x,y,1,1,0,c_white,alpha)
draw_set_alpha(temp_alpha)
draw_set_blend_mode(bm_normal)
}


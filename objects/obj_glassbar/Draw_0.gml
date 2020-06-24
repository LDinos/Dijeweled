/// @description Insert description here
//draw_sprite_part(spr_glue,0,0,0,32,height,x,y-8)
draw_sprite_ext(spr_glue,0,x,y-15,1,lerp(0,15.5,timenow/deftime),0,c_white,1)
draw_self()
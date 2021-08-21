/// @description Insert description here

var scale = image_xscale*clamp(timer/12-2,0,1)
draw_sprite_ext(sprite_index,image_index,x,y,scale,scale,0,c_white,1);
/// @description Insert description here
draw_sprite_tiled_ext(sprite_index,0,x+time,y,4,4,c_white,image_alpha)
draw_set_alpha(alpha)
draw_rectangle(x,y,xtouse,room_height,false)
draw_set_alpha(1)
draw_sprite_ext(spr_levelcomplete_smallfade,0,xtouse,y,4,160,0,c_white,alpha)
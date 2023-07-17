/// @description
draw_rectangle_color(x - box_width/2, y, x + box_width/2, y + box_height, DARK_GRAY, DARK_GRAY,DARK_GRAY,DARK_GRAY,false)
draw_rectangle_color(x - box_width/2, y, x + box_width/2, y + box_height, c_black, c_black,c_black,c_black,true)
draw_sprite(sprite_index, image_index, x, y + box_height/2)
if (hover) draw_sprite_ext(spr_black,1,x-box_width/2,y,box_width,box_height,0,c_white,0.5)


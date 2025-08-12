/// @description
draw_sprite_ext(spr_black,0,0,0,room_width,room_height,0,c_white,0.7)
draw_sprite(sprite_index,image_index,x,y)
var center_x = x + sprite_width/2
var center_y = y + sprite_height/2
centerize_text()
draw_text_transformed(description_x, description_y, description, 1, 1, 0)
draw_text_transformed(center_x, center_y, input + blinker, 0.8, 0.8, 0)
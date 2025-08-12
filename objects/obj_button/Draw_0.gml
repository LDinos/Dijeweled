/// @description
var x2 = x + button_width
var y2 = y + button_height
var xcenter = x + button_width/2
var ycenter = y + button_height/2

draw_rectangle_monocolor(x, y, x2, y2, color, false)
if (hover) draw_sprite_ext(spr_black, 1, x, y, button_width, button_height, 0, c_white, 0.5)
centerize_text()
draw_text_transformed(xcenter, ycenter, text, text_size, text_size, 0)
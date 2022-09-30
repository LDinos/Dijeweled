/// @description 
draw_sprite(spr_lvlbar_bot,0,x-8,y)
draw_sprite_part(spr_flow,image_index,0,0,(time_now/time_full)*bar_end,32,x,y+8)
draw_sprite(spr_lvlbar_top,0,x-8,y)
var k = floor(time_now)
if k <= 0 k = 0
var t = string(k div 60)+":"+(k mod 60 >= 10 ? string(k mod 60) : "0"+string(k mod 60))
draw_text_outline_transformed(x+256,y+24,t,c_white,c_black,0.75)

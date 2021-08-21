/// @description Insert description here
draw_rectangle_monocolor(x,y,x+width,y+height,BLACK_GRAY,false)
centerize_text()
draw_set_font(font0)
draw_text_outline(x + width/2,y+32,text,c_white,c_black)
if hover draw_sprite_ext(spr_black,1,x,y,width,height,0,c_white,0.3)
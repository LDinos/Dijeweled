/// @description Insert description here
var x_center,y_center;
x_center = x + sprite_width/2 //center in x axis
y_center = y + sprite_height/2 //center in y axis

centerize_text() //make v_align and h_align centred
draw_set_font(font0)
draw_self()
if unlocked draw_text_outline(x_center,y_center,"SWIFT",c_yellow,c_orange)
else draw_text_outline(x_center,y_center,"?",c_yellow,c_orange)
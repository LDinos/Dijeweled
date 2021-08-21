/// @description Insert description here
var x_center,y_center;
x_center = x + sprite_width/2 //center in x axis
y_center = y + sprite_height/2 //center in y axis

centerize_text() //make v_align and h_align centred

draw_self()
draw_text(x_center,y_center,"READY")
if error draw_text_outline(x_center,y_center-128,"Twist mode for bots is not available yet",c_red,c_black)
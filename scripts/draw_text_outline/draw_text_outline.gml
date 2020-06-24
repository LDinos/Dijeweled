/// draw_text_outline(x, y, text, textColor, outlineColor);
///@param x
///@param y
///@param text
///@param textColor
///@param outlineColor
var xx=argument0;
var yy=argument1;
var text=argument2;
var tcolor=argument3;
var ocolor=argument4;
 
var pcolor=draw_get_color();
 
draw_set_color(ocolor);
draw_text(xx-1, yy, text);
draw_text(xx+1, yy, text);
draw_text(xx, yy-1, text);
draw_text(xx, yy+1, text);
 
draw_set_color(tcolor);
draw_text(xx, yy, text);
draw_set_color(c_white);
/// draw_text_outline_transformed(x, y, text, textColor, outlineColor, size);
///@param x
///@param y
///@param text
///@param textColor
///@param outlineColor
///@param size
var xx=argument0;
var yy=argument1;
var text=argument2;
var tcolor=argument3;
var ocolor=argument4;
var s = argument5
 
var pcolor=draw_get_color();
 
draw_set_color(ocolor);
draw_text_transformed(xx-1, yy, text,s,s,0);
draw_text_transformed(xx+1, yy, text,s,s,0);
draw_text_transformed(xx, yy-1, text,s,s,0);
draw_text_transformed(xx, yy+1, text,s,s,0);
 
draw_set_color(tcolor);
draw_text_transformed(xx, yy, text,s,s,0);
draw_set_color(c_white);
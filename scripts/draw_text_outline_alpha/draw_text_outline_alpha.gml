/// draw_text_outline(x, y, text, textColor, outlineColor, alpha);
///@param x
///@param y
///@param text
///@param textColor
///@param outlineColor
///@param alpha
function draw_text_outline_alpha(argument0, argument1, argument2, argument3, argument4, argument5) {

	var xx=argument0;
	var yy=argument1;
	var text=argument2;
	var tcolor=argument3;
	var ocolor=argument4;
	var alph = argument5;
 

	draw_text_color(xx-1, yy, text,ocolor,ocolor,ocolor,ocolor,alph);
	draw_text_color(xx+1, yy, text,ocolor,ocolor,ocolor,ocolor,alph);
	draw_text_color(xx, yy-1, text,ocolor,ocolor,ocolor,ocolor,alph);
	draw_text_color(xx, yy+1, text,ocolor,ocolor,ocolor,ocolor,alph);
 

	draw_text_color(xx, yy, text,tcolor,tcolor,tcolor,tcolor,alph);



}

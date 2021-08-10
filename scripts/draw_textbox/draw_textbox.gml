///@param x
///@param y
///@param text
function draw_textbox(argument0, argument1, argument2) {
	draw_set_halign(fa_left)
	draw_set_font(font0)
	var w = string_width(argument2)*0.5
	draw_set_alpha(0.8)
	draw_rectangle_color(argument0-4,argument1-4-8,argument0+4+w,argument1+16+4-8,c_black,c_black,c_black,c_black,false)
	draw_set_alpha(1)
	draw_text_transformed(argument0,argument1,argument2,0.5,0.5,0)



}

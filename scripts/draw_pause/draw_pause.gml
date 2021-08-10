///@param is_bindings
function draw_pause(argument0) {

	var lg = $1a1a1a
	var dg = $111111

	//base
	draw_rectangle_color(x+228-8,y+132-8,x+1049+8,y+604+8,c_black,c_black,c_black,c_black,false)
	draw_rectangle_color(x+228,y+132,x+1049,y+604,lg,lg,lg,lg,false)
	draw_rectangle_color(x+256,y+160,x+1024,y+544,dg,dg,dg,dg,false)

	if !argument0
	{
		//resolution and margin
		draw_rectangle_color(x+416,y+448,x+576,y+512,c_black,c_black,c_black,c_black,false)
		draw_rectangle_color(x+704,y+448,x+864,y+512,c_black,c_black,c_black,c_black,false)
	}
	else
	{
		draw_set_font(font0)
		centerize_text()
		draw_rectangle_color(x+496,y+160,x+784,y+160+32,c_black,c_black,c_black,c_black,false)
		draw_text_transformed(x+639,y+178,"GAMEPAD BINDS",0.8,0.8,0)
	}




}

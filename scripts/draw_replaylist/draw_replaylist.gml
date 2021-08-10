var dg = BLACK_GRAY //dark gray
var lg = $201f1f //light gray
var ldg = $151414 //middle gray
draw_rectangle_color(32,128,736,608,lg,lg,lg,lg,false) //base light gray
draw_rectangle_color(0,96,736,128,c_black,c_black,c_black,c_black,false) //top titles

for(var i = 0; i<7;i++) //dark rows
{
	draw_rectangle_color(32,160 +i*64,736,192 +i*64,ldg,ldg,ldg,ldg,false)
}

draw_rectangle_color(0,128,32,608,dg,dg,dg,dg,false) //first collumn
draw_rectangle_color(416,128,432,608,dg,dg,dg,dg,false) //second little collumn
draw_rectangle_color(496,128,512,608,dg,dg,dg,dg,false) //third little col
draw_rectangle_color(624,128,640,608,dg,dg,dg,dg,false) //fourth little col

//scroll
draw_rectangle_color(736,112,736+16,112+16,$595959,$595959,$595959,$595959,false)
draw_rectangle_color(736,112+16,736+16,592,$373737,$373737,$373737,$373737,false)
draw_rectangle_color(736,592,736+16,592+16,$595959,$595959,$595959,$595959,false)

draw_set_font(font0)
centerize_text()
draw_text_transformed(16,112,"No.",0.8,0.8,0); draw_text_transformed(224,112,"Title",0.8,0.8,0); draw_text_transformed(464,112,"Time",0.8,0.8,0); draw_text_transformed(568,112,"Points",0.8,0.8,0); draw_text_transformed(688,112,"Date",0.8,0.8,0);
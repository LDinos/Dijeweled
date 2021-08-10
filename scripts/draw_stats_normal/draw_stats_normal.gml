///@description Makes a stats board for NAME-SCORE-LEVEL gamemodes
///@param personal
function draw_stats_normal(argument0) {
	var dg = $1a1a1a //dark gray
	var lg = $464646 //light gray

	draw_rectangle_color(560,32,720,64,$1a1a1a,$1a1a1a,$1a1a1a,$1a1a1a,false) //title
	draw_rectangle_color(400,64,880,96,$1a1a1a,$1a1a1a,$1a1a1a,$1a1a1a,false) //gray area below title

	for(var i =0; i <10;i++)
	{
		//FILL
		draw_rectangle_color(400,64+32 +32*i,432,96+32 +32*i,lg,lg,lg,lg,false)
		draw_rectangle_color(432,64+32 +32*i,608,96+32 +32*i,lg,lg,lg,lg,false)
		draw_rectangle_color(608,64+32 +32*i,784,96+32 +32*i,lg,lg,lg,lg,false)
		draw_rectangle_color(784,64+32 +32*i,880,96+32 +32*i,lg,lg,lg,lg,false)
		//OUTLINE
		draw_rectangle_color(400,64+32 +32*i,432,96+32 +32*i,dg,dg,dg,dg,true)
		draw_rectangle_color(432,64+32 +32*i,608,96+32 +32*i,dg,dg,dg,dg,true)
		draw_rectangle_color(608,64+32 +32*i,784,96+32 +32*i,dg,dg,dg,dg,true)
		draw_rectangle_color(784,64+32 +32*i,880,96+32 +32*i,dg,dg,dg,dg,true)

	}

	draw_set_font(font2)
	centerize_text()
	draw_text(416,80,"No."); draw_text(520,80,"Name"); draw_text(696,80,"Score") ; draw_text(832,80,"Level")

	if argument0
	{
		draw_rectangle_color(400,464,880,528,dg,dg,dg,dg,false)
		draw_rectangle_color(400,464,880,464+32,c_black,c_black,c_black,c_black,false)
		draw_rectangle_color(400,528,880,560,lg,lg,lg,lg,false)
	
		draw_rectangle_color(400,528,608,560,dg,dg,dg,dg,true)
		draw_rectangle_color(608,528,784,560,dg,dg,dg,dg,true)
		draw_rectangle_color(784,528,880,560,dg,dg,dg,dg,true)
	
		draw_text(640,480,"PERSONAL")
		draw_text(504,514,"Name"); draw_text(696,514,"Score") ; draw_text(832,514,"Level")
	}


}

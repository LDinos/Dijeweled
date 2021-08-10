///@description Makes a stats board for NAME-SCORE-LEVEL gamemodes
///@param personal
function draw_stats_blitz(argument0) {
	var dg = $1a1a1a //dark gray
	var lg = $464646 //light gray

	draw_rectangle_color(560,32,720,64,$1a1a1a,$1a1a1a,$1a1a1a,$1a1a1a,false) //title
	draw_rectangle_color(448,64,832,96,$1a1a1a,$1a1a1a,$1a1a1a,$1a1a1a,false) //gray area below title

	for(var i =0; i <10;i++)
	{
		//OUTLINES
		draw_rectangle_color(448,64+32 +32*i,448+32,96+32 +32*i,lg,lg,lg,lg,false)
		draw_rectangle_color(448+32,64+32 +32*i,656,96+32 +32*i,lg,lg,lg,lg,false)
		draw_rectangle_color(656,64+32 +32*i,832,96+32 +32*i,lg,lg,lg,lg,false)
		//FILL
		draw_rectangle_color(448,64+32 +32*i,448+32,96+32 +32*i,dg,dg,dg,dg,true)
		draw_rectangle_color(448+32,64+32 +32*i,656,96+32 +32*i,dg,dg,dg,dg,true)
		draw_rectangle_color(656,64+32 +32*i,832,96+32 +32*i,dg,dg,dg,dg,true)

	}

	draw_set_font(font2)
	centerize_text()
	draw_text(464,80,"No."); draw_text(568,80,"Name"); draw_text(744,80,"Score");

	if argument0
	{
		draw_rectangle_color(448,464,832,528,dg,dg,dg,dg,false)
		draw_rectangle_color(448,464,832,464+32,c_black,c_black,c_black,c_black,false)
		draw_rectangle_color(448,528,832,560,lg,lg,lg,lg,false)
	
		//draw_rectangle_color(448,528,448+32,560,dg,dg,dg,dg,true)
		draw_rectangle_color(448,528,656,560,dg,dg,dg,dg,true)
		draw_rectangle_color(656,528,832,560,dg,dg,dg,dg,true)
	
		draw_text(640,480,"PERSONAL")
		draw_text(544,514,"Name"); draw_text(736,514,"Score")
	}


}

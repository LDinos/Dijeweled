/// @description Insert description here
draw_set_font(font2)
//draw_self()
centerize_text()
draw_stats_normal(false)
//Title
draw_text(640,48,title)

//Stats board
for(var i=0; i<10;i++)
{
	var color = c_white
	draw_text_color(416,112 + 32*i,string(i+1),color,color,color,color,1) //draw No.
	draw_text_color(520,112 + 32*i,stats_board[# i,0],color,color,color,color,1) //draw Name
	draw_text_color(696,112 + 32*i,stats_board[# i,1],color,color,color,color,1) //draw Score
	draw_text_color(832,112 + 32*i,"Level " + string(stats_board[# i,2]),color,color,color,color,1) //draw Level
}
/*
//Personal
color = c_yellow
draw_text_color(504,544,global.user,color,color,color,color,1) //draw Name
draw_text_color(696,544,global.STATS_points,color,color,color,color,1) //draw Score
draw_text_color(832,544,"Level " + string(global.STATS_level),color,color,color,color,1) //draw Level
*/
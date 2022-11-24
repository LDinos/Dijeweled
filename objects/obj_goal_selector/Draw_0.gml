/// @description Insert description here
centerize_text()
//draw_self()
#region DRAW TABLES
	var ddg = BLACK_GRAY
	var dg = DARK_GRAY
	var lg = LIGHT_GRAY
	draw_sprite_ext(spr_black,0,0,0,room_width,room_height,0,c_white,0.5) //blackness behind
	draw_rectangle_color(160,0,592,32,ddg,ddg,ddg,ddg,false) //TOP BAR
	draw_rectangle_color(160,32,592,704,lg,lg,lg,lg,false) //body
	for(var i = 0; i < 11; i++)
	{
		if i < 10
		{
		draw_rectangle_color(160,64 +i*64,304,64+32 +i*64,dg,dg,dg,dg,false) //all dark grays for first collumn
		draw_rectangle_color(448,64 +i*64,592,64+32 +i*64,dg,dg,dg,dg,false) //all dark grays for third collumn
		}
		draw_rectangle_color(304,32+i*64,448,64 +i*64,dg,dg,dg,dg,false) //all dark grays for middle collumn
	}
	draw_rectangle_color(656,272,1120,402,dg,dg,dg,dg,false) //infobox
	draw_rectangle_color(656,272-32,1120,272,ddg,ddg,ddg,ddg,false) //infobox top
	draw_line_color(448,0,448,704,ddg,ddg)
	draw_text(160 + (448-160)/2,16,"Goals")
	draw_text(448 + (592-448)/2,16,"Conditions")
	
	for(var i = 0; i < 21; i++) //Column 1
	{
		draw_text_transformed_color(160 + (304-160)/2,48 + i*32,info[i,0],0.6,0.6,0,c_green,c_green,c_green,c_green,1)
	}
	for(var i = 0; i < 17; i++) //Column 2
	{
		draw_text_transformed_color(304 + (448-304)/2,48 + i*32,info[21+i,0],0.6,0.6,0,c_green,c_green,c_green,c_green,1)
	}
	for(var i = 0; i < 7; i++) //Limiters
	{
		draw_text_transformed_color(448 + (592-448)/2,48 + i*32,info[21+21+i,0],0.6,0.6,0,c_red,c_red,c_red,c_red,1)
	}
#endregion
//draw_text(x+16,y+16,hover)
if hover > -1
{
	draw_sprite(spr_goal_glow,0,16*10 +144*xx, 32 + 32*yy)
	draw_text(656+(1120-656)/2,258,info[hover,0])
	draw_set_valign(fa_top)
	draw_text_transformed(656+(1120-656)/2,300,info[hover,1],0.6,0.6,0)
}
else
{
	draw_text(656+(1120-656)/2,258,"Information")
	draw_set_valign(fa_top)
	draw_text_transformed(656+(1120-656)/2,300,"Hover onto an option to read its functionality!",0.6,0.6,0)
}
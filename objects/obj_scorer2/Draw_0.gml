/// @description Insert description here
// You can write your code in this editor
var points2, matches2, style2;
if !global.online
{
	points2 = Gamerule_local.points
	matches2 = Gamerule_local.matches
	style2 = Gamerule_local.style
}
else
{
	if global.IAMHOST
	{
		points2 = Gamerule_2.points
		matches2 = Gamerule_2.matches
		style2 = Gamerule_2.style
	}
	else
	{
		points2 = Gamerule_1.points
		matches2 = Gamerule_1.matches
		style2 = Gamerule_1.style
	}
}

draw_self()
draw_sprite(spr_scorer2_1,win[0],x-512,y)
draw_sprite(spr_scorer2_2,win[1],x-512,y)
draw_sprite(spr_scorer2_3,win[2],x-512,y)
draw_sprite(spr_scorer2_front,0,x-512,y)
draw_set_font(fnt_open24display)
draw_set_halign(fa_center)
draw_set_valign(fa_middle)
draw_text(x-218,y+30,points2)
draw_text(x-218,y+30 + 32*1,matches2)
draw_text(x-218,y+30 + 32*2,style2)
draw_set_font(font2)

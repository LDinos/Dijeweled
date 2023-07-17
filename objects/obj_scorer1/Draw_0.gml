/// @description Insert description here
// You can write your code in this editor
var points1, matches1, style1;
if global.IAMHOST || global.spectator
{
	points1 = Gamerule_1.points
	matches1 = Gamerule_1.matches
	style1 = Gamerule_1.style
}
else
{
	points1 = Gamerule_2.points
	matches1 = Gamerule_2.matches
	style1 = Gamerule_2.style
}

draw_self()
draw_sprite(spr_scorer1_1,win[0],x,y)
draw_sprite(spr_scorer1_2,win[1],x,y)
draw_sprite(spr_scorer1_3,win[2],x,y)
draw_sprite(spr_scorer1_front,0,x,y)
draw_set_font(fnt_open24display)
draw_set_halign(fa_center)
draw_set_valign(fa_middle)
draw_text_transformed(x+218,y+30,number_convert_with_commas(points1), 0.85, 0.85, 0)
draw_text_transformed(x+218,y+30 + 32*1,matches1, 0.85, 0.85, 0)
draw_text_transformed(x+218,y+30 + 32*2,number_convert_with_commas(style1), 0.85, 0.85, 0)
draw_set_font(font2)

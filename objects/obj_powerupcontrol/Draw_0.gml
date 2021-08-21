/// @description Insert description here
//draw_text(x,y,TurnsToSpawnCur)
draw_set_font(font0)
centerize_text()
var posx = Board_1.x + 512/2 - 32
var posy = Board_1.y + 512
var posx2 = Board_2.x + 512/2 - 32
var posy2 = Board_2.y + 512
draw_text(x+15,y+524,PowerupTurns)
if Gamerule_1.inverted_swaps 
{
	draw_sprite_ext(spr_black,0,posx-32,posy-32,64,64,0,c_white,0.5)
	draw_sprite(spr_powerups,4,posx,posy); 
	draw_text_outline(posx,posy+48,inverted_timer,c_white,c_black); 
	posx+=64; posy+=64
}
if Gamerule_1.horizontal_swaps_only 
{
	draw_sprite_ext(spr_black,0,posx-32,posy-32,64,64,0,c_white,0.5)
	draw_sprite(spr_powerups,3,posx,posy); 
	draw_text_outline(posx,posy+48,horver_timer,c_white,c_black);
}
else if Gamerule_1.vertical_swaps_only 
{
	draw_sprite_ext(spr_black,0,posx-32,posy-32,64,64,0,c_white,0.5)
	draw_sprite(spr_powerups,2,posx,posy); 
	draw_text_outline(posx,posy+48,horver_timer,c_white,c_black);
}

if Gamerule_2.inverted_swaps 
{
	draw_sprite_ext(spr_black,0,posx2-32,posy2-32,64,64,0,c_white,0.5)
	draw_sprite(spr_powerups,4,posx2,posy2)
	posx2+=64; posy2+=64
}
if Gamerule_2.horizontal_swaps_only 
{
	draw_sprite_ext(spr_black,0,posx2-32,posy2-32,64,64,0,c_white,0.5)
	draw_sprite(spr_powerups,3,posx2,posy2)
}
else if Gamerule_2.vertical_swaps_only 
{
	draw_sprite_ext(spr_black,0,posx2-32,posy2-32,64,64,0,c_white,0.5)
	draw_sprite(spr_powerups,2,posx2,posy2)
}
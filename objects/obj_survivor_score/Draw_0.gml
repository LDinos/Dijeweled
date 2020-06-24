/// @description Insert description here
// You can write your code in this editor
draw_set_font(font0)
centerize_text()

draw_sprite(sprite_index,0,x,y)
draw_text(xcenter,ycenter,"Moves: " + string(Gamerule_1.Moves_Made))
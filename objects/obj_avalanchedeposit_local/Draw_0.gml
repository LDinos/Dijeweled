/// @description Insert description here
// You can write your code in this editor
draw_sprite(spr_rails1,0,room_width/2,y)
draw_self()
draw_set_halign(fa_left)
draw_set_font(font0)
draw_text(x - sprite_width/2 + 88,y-24,gems_to_send)
//draw_text(x - sprite_width/2 + 88*4,y-24,gemsmatched)
draw_text(x - sprite_width/2 + 88,y+24,gems_existing)
draw_set_halign(fa_center)
if gems_existing >= 64
{
draw_text_transformed_color(x+16,y,"YOU NEED TO MATCH\nAT LEAST " + string(gems_existing - 64 + 1) + " GEMS TO SURVIVE!",0.7,0.7,0,c_yellow,c_yellow,c_yellow,c_yellow,alpha)
//draw_sprite_ext(spr_warn,player_turn-1,room_width/2,512,1,1,0,c_white,alpha-0.5)
}
draw_sprite(spr_rails2,0,room_width/2,y)
draw_text_outline(room_width/2,512+room_height/2 - 64,"Turns: " + string(num_turns), c_white,c_black)
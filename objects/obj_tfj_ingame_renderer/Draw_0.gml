//draws the round counter
if(current_round >=0)
{
	draw_sprite(spr_TFJ_ingame_round_counter,current_round,room_width/2-sprite_get_width(spr_TFJ_ingame_round_counter)/2,room_start_y)
}

//draw timer
draw_text_color(200,room_start_y+100,timer,c_black,c_black,c_black,c_black,1)
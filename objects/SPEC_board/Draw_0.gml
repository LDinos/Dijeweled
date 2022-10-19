//Self
draw_self()
draw_sprite_ext(spr_board_blazing,0,x,y,1,1,0,c_white,alpha) //Blazing board as overlay

//PBOX
var length = string_length(player_name)
draw_sprite(spr_playerbox, player_id, x + (128/2) - 32, y-32-16)

draw_set_font(font0)
draw_set_halign(fa_center)
draw_set_valign(fa_middle)
if (length > 5) draw_text_transformed(x + 64 -32, y-32-16, player_name, 7/length, 7/length, 0)
else draw_text_transformed(x + 64 - 32, y-32-16, player_name, 6/7, 6/7, 0)

/// @description Insert description here
draw_self()
centerize_text()
draw_set_font(font0)
draw_text(x + (sprite_width/2), y + (sprite_height/2) - 32, number_convert_with_commas(scoretemp))
if !Gamerule_1.time_allowed draw_text(x + (sprite_width/2), y + (sprite_height/2) + 36, "Level " + number_convert_with_commas(Gamerule_1.level))
else draw_text(x + (sprite_width/2), y + (sprite_height/2) + 36, time)
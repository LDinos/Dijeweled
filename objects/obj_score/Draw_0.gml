/// @description Insert description here
draw_self()
centerize_text()
draw_set_font(font0)
draw_text(x + (sprite_width/2), y + (sprite_height/2) - 32, scoretemp)
if !Gamerule_1.time_allowed draw_text(x + (sprite_width/2), y + (sprite_height/2) + 36, "Level " + string(Gamerule_1.level))
else draw_text(x + (sprite_width/2), y + (sprite_height/2) + 36, time)
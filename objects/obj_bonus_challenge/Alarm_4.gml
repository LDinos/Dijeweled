/// @description Fade in
perc2 += FADE_OFF_SPEED 
x = lerp(0-sprite_width,xx2,1 - power(perc2-1,2))
if perc2 < 1 alarm[4] = 1
else {perc2 = 0; moving = false}
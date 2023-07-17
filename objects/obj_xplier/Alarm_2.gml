/// @description Fade in
perc2 += FADE_OFF_SPEED 
x = lerp(0 - sprite_width-4,xx,1 - power(perc2-1,2))
if perc2 < 1 alarm[2] = 1
else perc2 = 0
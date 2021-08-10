/// @description Fade off
perc2 += FADE_OFF_SPEED 
x = lerp(xx,0-sprite_width-4,1 - power(perc2-1,2))
if perc2 < 1 alarm[1] = 1
else perc2 = 0
/// @description Fade off
perc += FADE_OFF_SPEED 
x = lerp(xx,0-sprite_width,1 - power(perc-1,2))
if perc < 1 alarm[2] = 1
else perc = 0
/// @description Fade in
perc += FADE_OFF_SPEED 
x = lerp(0-sprite_width,xx,1 - power(perc-1,2))
if perc < 1 alarm[1] = 1
else perc = 0
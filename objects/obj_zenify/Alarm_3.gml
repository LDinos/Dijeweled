/// @description Fade in
perc += 0.05
x = lerp(0 - sprite_width,xx,1 - power(perc-1,2))
if perc < 1 alarm[3] = 1
else perc = 0
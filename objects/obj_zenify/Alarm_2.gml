/// @description Insert description here
/// @description Fade off
perc += 0.05
x = lerp(xx,0-sprite_width,1 - power(perc-1,2))
if perc < 1 alarm[2] = 1
else perc = 0
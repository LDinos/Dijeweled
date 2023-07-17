/// @description Fade off
moving = true //we are animating, hide indicator
perc2 += 0.05
x = lerp(xx2,0-sprite_width,1 - power(perc2-1,2))
if perc2 < 1 alarm[3] = 1
else perc2 = 0
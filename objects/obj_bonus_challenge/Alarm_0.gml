/// @description Indicator animation
perc += 0.1
indicator_x = lerp(xx, x + bonus_index*64, 1 - power(perc-1,2))
if perc < 1 alarm[0] = 1

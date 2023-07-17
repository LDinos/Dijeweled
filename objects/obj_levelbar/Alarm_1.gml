/// @description Fade in
perc += 0.05
x = lerp(room_width+16,xx,1 - power(perc-1,2))
if perc < 1 alarm[1] = 1
else perc = 0
/// @description Insert description here
alpha = 0
image_speed = 0
image_index = 6 - global.timer div 60 -1
Gamerule_1.xplier = 6 - global.timer div 60 
if global.online Gamerule_2.xplier = 6 - global.timer div 60
else Gamerule_local.xplier = Gamerule_1.xplier
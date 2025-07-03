/// @description
base_alpha += 0.25*Gamerule_1.speed_modifier
if base_alpha < 1 alarm[1] = 1
else alarm[2] = alarm[0] - 4/Gamerule_1.speed_modifier

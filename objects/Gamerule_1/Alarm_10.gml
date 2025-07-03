/// @description stop slow mo
coal_speed_modifier += 0.02
if (coal_speed_modifier >= 1) {
	coal_speed_modifier = 1
}
else alarm[10] = 1


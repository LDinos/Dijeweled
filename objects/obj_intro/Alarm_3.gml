/// @description Glowing animation
current_glow_x += glow_speed
if (current_glow_x < glow_end) alarm[3] = 1
else {
	current_glow_x = 0
	alarm[4] = 10
	alarm[3] = 15*60
}












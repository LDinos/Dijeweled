/// @description Insert description here
image_index = 0
image_speed = 0
margin = 4 //a little small value after which a text starts
val = global.SET_gamemode
if (val = 1) 
{
	instance_destroy(LOB_gamemode_2); 
	var g = instance_create(16,336,LOB_gamemode_defence); 
}
valmin = 0
valmax = 1
hover = false
choice[0] = "TIME ATTACK"
choice[1] = "AVALANCHE"
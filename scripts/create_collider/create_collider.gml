///@description When gems are destroyed, we still need some collision before gems above start to fall
///@param do_alarm
///@param alarm_value
var blocker = instance_create_depth(x,y,-99,stopper)
	with(blocker)
	{
		x -= 32
		y -= 32
		image_xscale = 64/sprite_width
		image_yscale = 64/sprite_height
		if argument0 alarm[0] = argument1 //destroy me after some frames
	}
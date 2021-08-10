/// @description start accelerating spinning
if acc < maxacc //8
{
	acc+=0.05
	alarm[1] = 1
}
else
{
	acc = maxacc
    with(wheel_butt) 
	{
		image_alpha = 1; amready = 1
		if Gamerule_1.isReplay event_user(0)
	}
}


/// @description Move the spinner down after the process
func += 0.02
if func <= 1
{
	y = lerp(yy, room_height+(sprite_height/2),power(func,2))
	pipe_x = lerp(pipe_x, 1280/2,0.02)
	alarm[6] = 1
}
else
{ 
alarm[7] = 15
}


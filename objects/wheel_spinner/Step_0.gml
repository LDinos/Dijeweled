/// @description rot
with(Gamerule_1) ready = false
if ended rot = lerp(dest,rot,k)
rot+= acc
if rot >= 180 rot -= 180

if spawn_move
{
	pipe_x = lerp(pipe_x,0,0.12)
	y = lerp(y, ytoreach, 0.12)
	if (abs(y - ytoreach) < 0.2)
	{
		pipe_x = 0
		y = ytoreach
		spawn_move = false; 
		alarm[1] = 10
	}
}
//debug
/*
green = true
if Gamerule.bombdanger = 1
    {
    if (rot <= 112 && rot >= 67.5)
        {
        green = false
        }            
    }
else if Gamerule.bombdanger = 2
    {
    if (rot <=112.5 && rot>=22.5)
        {
        green = false
        }
    }
else if Gamerule.bombdanger = 3
    {
    if (rot <=157.5 && rot>=22.5)
        {
        green = false
        }
    }
//


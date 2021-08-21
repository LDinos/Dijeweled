/// @description shrink
if xscale > 0.5
    {
    action_set_alarm(1,0)
    xscale -= 0.05
    }
else action_set_alarm(1,1)


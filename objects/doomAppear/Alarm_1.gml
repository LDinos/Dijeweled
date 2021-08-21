/// @description grow
if xscale < 1.5
    {
    action_set_alarm(1,1)
    xscale += 0.05
    }
else action_set_alarm(1,0)


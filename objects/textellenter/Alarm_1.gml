xscale += 0.01*0.5
yscale += 0.01*0.5
alpha -= 0.02
if alpha > 0 action_set_alarm(1,1)
else instance_destroy();


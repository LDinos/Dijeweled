///@description Leave
image_alpha -= 0.01
if image_alpha > 0 action_set_alarm(1,1)
else instance_destroy();


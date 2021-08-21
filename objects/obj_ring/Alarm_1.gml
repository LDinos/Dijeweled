/// @description FADE OFF
image_alpha -= 0.05/modifier
if image_alpha > 0 action_set_alarm(2*modifier,1)
else instance_destroy();


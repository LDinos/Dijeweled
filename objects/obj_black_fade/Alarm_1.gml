/// @description Make screen appear
image_alpha -= 0.05
if image_alpha > 0 alarm[1] = 1
else
{
	instance_destroy()
}
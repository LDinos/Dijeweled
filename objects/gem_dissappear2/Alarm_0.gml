/// @description Insert description here
// You can write your code in this editor
//if scaleplus <= 0
{
imagexscale -= 0.1/modifier
imageyscale -= 0.1/modifier
image_alpha -= 0.025
if imagexscale > 0 alarm[0] = 1
else instance_destroy()
}
//else alarm[0] = 1
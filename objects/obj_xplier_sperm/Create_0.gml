/// @description Insert description here
image_alpha = 0
alarm[1] = 1
depth = -10
func = 0
yy = y
xx = x
if instance_exists(obj_xplier_num)
{
ytogo = obj_xplier_num.y + 96
xtogo = obj_xplier_num.x + 48
}
else instance_destroy()
with(obj_bonus_challenge) sperm_travelling++
pd =point_direction(x,y,xtogo,ytogo)
image_angle = pd
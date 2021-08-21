modifier = 1
if Gamerule_1.isReplay modifier = 2
depth = -10
scale = random_range(0.5,0.8)
angle = 0 //angle of self
angle1 = 0 //angle of ray 1
angle2 = 0 //angle of ray 2
func = 0
ysp = irandom_range(-5 div modifier,-3 div modifier)
do
{
xsp = irandom_range(-2 div modifier,2 div modifier)
}
until xsp != 0
alarm[0] = 1 //lessen ysp
var modi;
if modifier = 1 modi = 1
else modi = 3
alarm[1] = irandom_range(60,90)*(modi/modifier) //destroy
part_emitter_region(global.sys_above_gem,global.coalbreakemit,x,x,y,y,ps_shape_ellipse,ps_distr_linear)


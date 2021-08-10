/* Desc

Kills the gems one by one, row by row / col by col, after
a lightning gem is exploded. The sprite is created on the
lightningObj object

*/
depth = -5
//magn1 = instance_create(x,y,obj_magnify)
//magn2 = instance_create(x,y,obj_magnify)
//magn3 = instance_create(x,y,obj_magnify)
//magn4 = instance_create(x,y,obj_magnify)
//with(magn1) moveup = true
//with(magn2) movedown = true
//with(magn3) moveleft = true
//with(magn4) moveright = true
skinnum = -1
modifier = 1
if Gamerule_1.isReplay modifier = 2
w_count = 1
for (p=0;p<=7;p++)
{

with(instance_position(x,Board_1.y + p*64,Gem_1)) {amLit = true}
with(instance_position(Board_1.x + p*64,y,Gem_1)) {amLit = true}
}
alarm[0] = 20*modifier

/* */
/*  */

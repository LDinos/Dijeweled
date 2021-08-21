if instance_exists(mygem)
{
part_particles_create(global.sys_above_gem,irandom_range(x-32,x+32),irandom_range(y-32,y+32),global.gemdoom1,1)
part_particles_create(global.sys_above_gem,irandom_range(x-32,x+32),irandom_range(y-32,y+32),global.gemdoom2,1)
alarm[6] = 2
}


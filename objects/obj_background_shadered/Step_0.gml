/// @description Insert description here
if global.OPT_lightallowed
{
	if shd == 4
	{
		cloud_doonce = false
		if part_particles_count(cloud_sys) == 0
		{
			repeat(5)
			{
				part_particles_create(cloud_sys,irandom_range(x-256,x+256),irandom_range(y-128,y+128),cloud_part_instant,1)
			}
		}
		if alarm[0] == -1 alarm[0] = irandom_range(3*60,6*60)
	}
	else
	{
		if !cloud_doonce
		{
			cloud_doonce = true
			part_particles_clear(cloud_sys)
		}
		alarm[0] = -1
	}

	if shd == 5
	{
		rain_doonce = false
		if alarm[1] == -1 alarm[1] = 6
	}
	else
	{
		if !rain_doonce
		{
			rain_doonce = true
			part_particles_clear(cloud_sys)
		}
		alarm[1] = -1
	}
	
	if shd == 2
	{
		laser_doonce = false
		if alarm[2] == -1 alarm[2] = 15
	}
	else
	{
		if !laser_doonce
		{
			laser_doonce = true
			part_particles_clear(cloud_sys)
		}
		alarm[2] = -1
	}
}
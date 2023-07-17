
#region accspeed and replay slowmo modifier
	var accspeed = 0.6;
	modifier = 1;
#endregion

#region Gem movement and collision
var shouldmove = true
if (ammoving) || (dont_fall_yet) shouldmove = false
else if (amInvisible) shouldmove = false
else if (MyGamerule.lightOn) shouldmove = false
else if (MyGamerule.hypeOn) shouldmove = false
else if (amLocked = 3) shouldmove = false
else if (MyGamerule.fruit_exploding_dontmove) shouldmove = false
if shouldmove
{
	{		
			acc += accspeed
			if (y + acc > Board_2.y + 512-64)
			{
				acc = 0
				y = Board_2.y + 512-64
			}
			else
			{
				if _i < 0
				{
					var toucher = noone
				}
				else
				{
					var toucher = collision_point(x,y+acc+(sprite_height/2),Gem_2,false,true)
				}
				if (toucher != noone) && (toucher != id)
				{
					if toucher.acc = 0
					{
						acc = 0
						y = toucher.y - toucher.sprite_yoffset - (sprite_height/2)//...find the other y, and depending on the y origin, move it exactly above it
					}
					else if acc >= toucher.acc
					{
						acc = toucher.acc - accspeed
						y = toucher.y - toucher.sprite_yoffset - (sprite_height/2)//...find the other y, and depending on the y origin, move it exactly above it
					}
				}
				else
				{
					if !MyGamerule.flameon || acc < 0
					{
						y+=acc
					}
					else acc = 0
				}	
			}
			
	}
} else acc = 0

#endregion

#region _i and _j
var previous_i = _i
_i = (y-MyBoard.y+63) div 64
_j = (x-MyBoard.x) div 64
#endregion

#region Gempower particles
var luck,sys;
if gempower > 0 && visible
{
	if gempower = 1
	{
		part_particles_create(global.sys_below_gem,x,y,global.partFire,1)
	}
	else if gempower = 2 //lighting
	{
		luck = irandom(10)
		if luck < 2 sys = global.sys_above_gem
		else sys = global.sys_below_gem
		part_emitter_region(sys,global.emit_newstar,x-32,x+32,y-32,y+32,ps_shape_ellipse,ps_distr_gaussian)
		part_emitter_burst(sys,global.emit_newstar,global.part_star_bolt,2)
	}
	else if gempower = 3 //nova
	{
		luck = irandom(10)
		if luck < 2 sys = global.sys_above_gem
		else sys = global.sys_below_gem
		part_emitter_region(sys,global.emit_newstar,x-32,x+32,y-32,y+32,ps_shape_ellipse,ps_distr_gaussian)
		part_emitter_burst(sys,global.emit_newstar,global.part_star_bolt,2)
		part_particles_create(global.sys_below_gem,x,y,global.partNovaFire,1)
	}
	else if gempower = 4 //septa
	{
		part_particles_create(global.sys_below_gem,x,y,global.partFire,1)
		part_particles_create(global.sys_below_gem,x,y,global.partCinder,1)
		luck = irandom(10)
		if luck < 2 sys = global.sys_above_gem
		else sys = global.sys_below_gem
		part_emitter_region(sys,global.emit_newstar,x-32,x+32,y-32,y+32,ps_shape_ellipse,ps_distr_gaussian)
		part_emitter_burst(sys,global.emit_newstar,global.part_star_bolt,2)
		part_particles_create(choose(global.sys_below_gem,global.sys_above_gem),x,y,global.partSeptafractal,1)
	}
	else if gempower = 5 //octa
	{
		part_particles_create(global.sys_below_gem,x,y,global.partFire,1)
		part_particles_create(global.sys_below_gem,x,y,global.partCinder,1)
		luck = irandom(10)
		if luck < 2 sys = global.sys_above_gem
		else sys = global.sys_below_gem
		part_emitter_region(sys,global.emit_newstar,x-32,x+32,y-32,y+32,ps_shape_ellipse,ps_distr_gaussian)
		part_emitter_burst(sys,global.emit_newstar,global.part_star_bolt,2)
		part_particles_create(choose(global.sys_below_gem,global.sys_above_gem),x,y,global.partOctafractal,1)
	}
	else if gempower = 6 //fruit
	{
		if (sprite_index != spr_fruits) sprite_index = spr_fruits
		if amFruitExploding
		{
			xmover = irandom_range(-2,2)
			ymover = irandom_range(-2,2)
		}
		else
		{
			part_particles_create(global.sys_above_gem,x,y,global.part_fruit_sparkles,1)
		}
	}
}
else if amHype
{
	part_particles_create(global.sys_below_gem,irandom_range(x-24,x+24),irandom_range(y-24,y+24),global.part_hypercube,1)
	if alarm[3] = -1 alarm[3] = 2
}
else if amLocked = 2 //Doom
{
	part_type_direction(global.d_g2,100,120,0,1)
    part_particles_create(global.sys_below_gem,x-16,y-32,global.d_g2,1)
    part_type_direction(global.d_g2,100-45,120-45,0,1)
    part_particles_create(global.sys_below_gem,x+16,y-32,global.d_g2,1) 
    part_type_direction(global.d_g1,100,120,0,1)   
    part_particles_create(global.sys_below_gem,x-16,y-32,global.d_g1,2)
    part_type_direction(global.d_g1,100-45,120-45,0,1)
    part_particles_create(global.sys_below_gem,x+16,y-32,global.d_g1,2)
}

#endregion

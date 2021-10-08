// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function scr_gempower_particles(){
	var XX = x+SWAP_X
	var YY = y+SWAP_Y
	var luck,sys; //randomizer stuff for particles below
	if gempower = FLAME //flame
	{
		if global.OPT_lightallowed
		{
			var shouldhappen = irandom(1)
			if shouldhappen != 1
			{
				var rand = irandom(particle_flame_points-1)
				var xx = path_get_point_x(particle_flame_asset,rand)
				var yy = path_get_point_y(particle_flame_asset,rand)
				var sys = global.sys_below_gem
				var luck = irandom(15) // 1/16
				if (luck == 0) sys = global.sys_above_gem
				part_particles_create(sys,XX+xx,YY+yy,global.part_newflame_ember,1)
				part_particles_create(sys,XX+xx,YY+yy,global.part_newflame,1)
			}
		}
		else
		{
			part_particles_create(global.sys_below_gem,XX,YY,global.partFire,1)
		}
	}
	else if gempower = LIGHTNING //lighting
	{
		luck = irandom(10)
		if luck < 2 sys = global.sys_above_gem
		else sys = global.sys_below_gem
		part_emitter_region(sys,global.emit_newstar,XX-32,XX+32,YY-32,YY+32,ps_shape_ellipse,ps_distr_gaussian)
		part_emitter_burst(sys,global.emit_newstar,global.part_star_bolt,2)
	}
	else if gempower = NOVA //nova
	{
		luck = irandom(10)
		if luck < 2 sys = global.sys_above_gem
		else sys = global.sys_below_gem
		part_emitter_region(sys,global.emit_newstar,XX-32,XX+32,YY-32,YY+32,ps_shape_ellipse,ps_distr_gaussian)
		part_emitter_burst(sys,global.emit_newstar,global.part_star_bolt,2)
		part_particles_create(global.sys_below_gem,XX,YY,global.partNovaFire,1)
	}
	else if gempower = SEPTA //septa
	{
		part_particles_create(global.sys_below_gem,XX,YY,global.partFire,1)
		part_particles_create(global.sys_below_gem,XX,YY,global.partCinder,1)
		luck = irandom(10)
		if luck < 2 sys = global.sys_above_gem
		else sys = global.sys_below_gem
		part_emitter_region(sys,global.emit_newstar,XX-32,XX+32,YY-32,YY+32,ps_shape_ellipse,ps_distr_gaussian)
		part_emitter_burst(sys,global.emit_newstar,global.part_star_bolt,2)
		part_particles_create(choose(global.sys_below_gem,global.sys_above_gem),XX,YY,global.partSeptafractal,1)
	}
	else if gempower = OCTA //octa
	{
		part_particles_create(global.sys_below_gem,XX,YY,global.partFire,1)
		part_particles_create(global.sys_below_gem,XX,YY,global.partCinder,1)
		luck = irandom(10)
		if luck < 2 sys = global.sys_above_gem
		else sys = global.sys_below_gem
		part_emitter_region(sys,global.emit_newstar,XX-32,XX+32,YY-32,YY+32,ps_shape_ellipse,ps_distr_gaussian)
		part_emitter_burst(sys,global.emit_newstar,global.part_star_bolt,2)
		part_particles_create(choose(global.sys_below_gem,global.sys_above_gem),XX,YY,global.partOctafractal,1)
	}
	else if gempower = FRUIT //fruit
	{
		if (sprite_index != spr_fruits) sprite_index = spr_fruits
		if amFruitExploding
		{
			xmover = irandom_range(-2,2)
			ymover = irandom_range(-2,2)
		}
		else
		{
			part_particles_create(global.sys_above_gem,XX,YY,global.part_fruit_sparkles,1)
		}
	}
}
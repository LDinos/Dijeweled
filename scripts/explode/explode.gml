/// @param Gem
function explode(argument0) {
	var gmrl = Gamerule_2
	if (argument0 == Gem_1) gmrl = Gamerule_1
	else if (argument0 == Gem_local) gmrl = Gamerule_local
	//\\
	magnify(x,y,true)
	var modi = 1
	var stle = 0
	if Gamerule_1.isReplay modi = 1.5
	with(gmrl) {compliment_add(150)}
	//\\
	with(gmrl)
		{
			flameon = true
			alarm[5] = 10
		}
	with(argument0) acc = 0
	audio_play_sound(snd_explode,0,0)
	for(var i=1;i<=15;i++)
	{
		part_particles_create(global.sys_above_gem,irandom_range(x-96,x+96),irandom_range(y-96,y+96),global.gemexplodetype,1)
	    part_particles_create(global.sys_above_gem,irandom_range(x-96,x+96),irandom_range(y-96,y+96),global.gemexplodetype2,1)
	}
	part_particles_create(global.sys_above_gem,x,y,global.gemexplodetype3,1) 
	for(var i=-1;i<=1;i++)
	{
		for(var j=-1;j<=1;j++)
		{
			var ITOUSE = clamp(_i + i, 0, 7)
			var JTOUSE = clamp(_j + j, 0, 7)
			if (i!=0 || j!=0)
			{
				with(gmrl.gem_board1[@ITOUSE,JTOUSE])
				{
					if !amPowered && matchme <= 0
					{
						create_col = false
						make_inv_dis = true
						stle+=20
						create_score_text_big(other.x,other.y,20,false)
						dontshake = true
						if amHype
						{									
							gem_to_hype = other.id
							skin_to_hype = other.skinnum
							instance_destroy()
						}
<<<<<<< HEAD
						else if gempower = 6
=======
						else if gempower = FRUIT
>>>>>>> 1.9
						{
							if !amFruitExploding
							{
								if gmrl.fruit_exploding 
								{
									ds_list_add(gmrl.list_of_fruits,id)
								}
								else
								{
									gmrl.fruit_exploding = true
									fruit_explode()
								}
							}
							amFruitExploding = true
						}
<<<<<<< HEAD
						else if gempower != 1 instance_destroy()
=======
						else if gempower != FLAME instance_destroy()
>>>>>>> 1.9
						else 
						{
							alarm[1] = 10*modi
						}
					}
				}
			}
		}
	}
	//\\
	for(var i=-1;i<=1;i++)
	{
		with(instance_position(x + 64*i, y - 128, argument0)) if !amPowered push_up(argument0)
	}
	with(gmrl) {points_add_nocombo(stle); compliment_add(stle); style_add(stle,false)}



}

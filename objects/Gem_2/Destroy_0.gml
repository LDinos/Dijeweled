if !amInvisible
{
	with(obj_avalanchedeposit) event_user(0)
	if amLocked > 0
	{
		audio_play_sound(snd_lock_break,0,0)
	}
	if mypowerup > -1
	{
		switch mypowerup
		{
			case 0:
				audio_play_sound(snd_avalanchebigcombo,0,0)
				with(Gem_1) gempower = 0
				with(global.mynet)
				{
					buffer_seek(buffer,buffer_seek_start,0)
					buffer_write(buffer,buffer_u8,NN_MATCH_POWERUP_POWERREMOVE)
					network_send_packet(client_socket,buffer,buffer_tell(buffer))
				}
				break;
			case 1:
				powerup_three_locks()
				audio_play_sound(snd_avalanchebigcombo,0,0)
				//net is inside the function above
				break;
			case 2:
				audio_play_sound(snd_avalanchebigcombo,0,0)
				Gamerule_1.vertical_swaps_only = true 
				Gamerule_1.horizontal_swaps_only = false//in case it was on
				with(obj_powerupcontrol) alarm[0] = 60*10 //reset it after some time
				break;
			case 3:
				audio_play_sound(snd_avalanchebigcombo,0,0)
				Gamerule_1.vertical_swaps_only = false//in case it was on
				Gamerule_1.horizontal_swaps_only = true
				with(obj_powerupcontrol) alarm[0] = 60*10 //reset it after some time
				break;
			case 4:
				audio_play_sound(snd_avalanchebigcombo,0,0)
				Gamerule_1.inverted_swaps = true
				with(obj_powerupcontrol) alarm[1] = 60*10 //reset it after some time
				break;
			
		}
	}
	if create_col 
	{
		with(instance_position(x,y-64,Gem_2)) {dont_fall_yet = true; alarm[7] = 10}
	}
	var diss = instance_create_depth(x,y,depth,MyDiss)
			with(diss) 
			{
				image_index = other.skinnum
			}
	#region gempower conditions
				if amHype
				{
					var cube = instance_create(x,y,obj_hypercube_detonate2)
					cube.image_index = hyper_anim
					cube.skin_to_hype = skin_to_hype
					Gamerule_2.hypeOn = true
				}
				else if gempower = OCTA
				{
					#region gempower 5
					//with(MyGamerule) {points_add(600,false); compliment_add(600)}
					with(Gem_2) {instance_destroy(); Gamerule_2.GEM_ID[myid] = -1}
					audio_play_sound(snd_septanovaexplode,2,false)
					instance_create(x,y,obj_novaexplode)
					part_particles_create(global.sys_above_gem,x,y,global.partSeptaExplosion,50)
					part_particles_create(global.sys_above_gem,x,y,global.partSeptaExplosion2,5)
					for(i=0;i<=7;i++)
					{	
						var lek = instance_create(MyBoard.x+32*7, MyBoard.y + 64*i, MyLightObj)
						with(lek) skinnum = other.skinnum
					}
					#endregion
				}
				else if gempower = SEPTA
				{
					#region gempower 4
					//with(MyGamerule) {points_add(500,false); compliment_add(500)}
					audio_play_sound(snd_septanovaexplode,2,false)
					instance_create(x,y,obj_novaexplode)
					part_particles_create(global.sys_above_gem,x,y,global.partSeptaExplosion,50)
					part_particles_create(global.sys_above_gem,x,y,global.partSeptaExplosion2,5)
					for(i=0;i<=4;i++)
					{
						le[i] = noone
						if position_meeting(MyBoard.x +32*7,y + (i-2)*64,MyBoard)
						{
							le[i] = instance_create(MyBoard.x +32*7,y+ (i-2)*64,MyLightObj)		
							with(le[i]) skinnum = other.skinnum
						}
				
						if position_meeting(x - (i-2)*64,MyBoard.y+32*7,MyBoard) 
						{
							le[i] = instance_create(x - (i-2)*64,MyBoard.y+32*7,MyLightObj)
							with(le[i]) {skinnum = other.skinnum; image_angle = 90}
						}
					}
					#endregion
				}
				else if gempower = NOVA
				    {
						#region gempower 3
						var le1 = noone;
						var le2 = noone;
						var le3 = noone;
						var le4 = noone;
						var le5 = noone;
						var le6 = noone;
						//with(MyGamerule) {points_add(300,false); compliment_add(300)}
				        audio_play_sound(snd_novaexplode,1,false)
						instance_create(x,y,obj_novaexplode)
				        if position_meeting(MyBoard.x +32*7,y,MyBoard) le1 = instance_create(MyBoard.x +32*7,y,MyLightObj)
						if position_meeting(MyBoard.x +32*7,y-64,MyBoard) le2 = instance_create(MyBoard.x +32*7,y-64,MyLightObj)
						if position_meeting(MyBoard.x +32*7,y+64,MyBoard) le3 = instance_create(MyBoard.x +32*7,y+64,MyLightObj)
				        if position_meeting(x,MyBoard.y +32*7,MyBoard) le4 = instance_create(x,MyBoard.y +32*7,MyLightObj)
						if position_meeting(x+64,MyBoard.y +32*7,MyBoard) le5 = instance_create(x+64,MyBoard.y +32*7,MyLightObj)
						if position_meeting(x-64,MyBoard.y +32*7,MyBoard) le6 = instance_create(x-64,MyBoard.y +32*7,MyLightObj)
				        with(le4) image_angle += 90
						with(le5) image_angle += 90
						with(le6) image_angle += 90
				        with(le1) skinnum = other.skinnum
				        with(le2) skinnum = other.skinnum
						with(le3) skinnum = other.skinnum
						with(le4) skinnum = other.skinnum
				        with(le5) skinnum = other.skinnum
						with(le6) skinnum = other.skinnum
						#endregion
				    }
				else if gempower = LIGHTNING
				    {
						#region gempower 2
						var le1 = noone;
						var le2 = noone;
				        audio_play_sound(snd_electro,1,false)
				        le1 = instance_create(MyBoard.x +32*7,y,MyLightObj)
				        le2 = instance_create(x,MyBoard.y +32*7,MyLightObj)
				        with(le1) skinnum = other.skinnum
				        with(le2) {image_angle += 90; skinnum = other.skinnum}
						#endregion
				    }
				else if gempower = FLAME
				{
					#region gempower 1
						magnify(x,y,true)
						var modi = 1
						with(MyGamerule)
						{
							flameon = true
							alarm[5] = 11*modi
						}
						with(MyGem) acc = 0
						audio_play_sound(snd_explode,0,0)
				        for(i=1;i<=15;i++)
				        {
					        part_particles_create(global.sys_above_gem,irandom_range(x-96,x+96),irandom_range(y-96,y+96),global.gemexplodetype,1)
					        part_particles_create(global.sys_above_gem,irandom_range(x-96,x+96),irandom_range(y-96,y+96),global.gemexplodetype2,1)
				        }
				        part_particles_create(global.sys_above_gem,x,y,global.gemexplodetype3,1)
					#endregion
				}
	#endregion
}
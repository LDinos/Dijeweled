/// @description Begone THOT!
// You can write your code in this editor
if (MyGamerule.gem_board1[_i,_j] == id) MyGamerule.gem_board1[_i,_j] =noone //remove me from the list

if !amInvisible //if I am visible
{
	
	with(obj_avalanchedeposit_local) event_user(0)
	#region remove gem if selected
		with(MyPlayer)
		{
			if (gem1 = other.id) gem1 = noone //delete list of gems in player when this is included
			if (gem2 = other.id) gem2 = noone //delete list of gems in player when this is included
			if (gemtocheck = other.id) gemtocheck = noone
		}
	#endregion
	
	if !amHype //if i am not a hypercube
	{

		if MyGamerule.combo >= 1 && !dontshake
		{
			add_xymover(MyGem)
		}

		if skinnum != 7 //if im not coal
		{
			#region gempower conditions
	
			if gempower = 5
			{
				#region gempower 5
				MyGamerule.octanovaOn = true
				audio_play_sound(snd_septanovaexplode,2,false)
				instance_create(x,y,obj_novaexplode)
				part_particles_create(global.sys_above_gem,x,y,global.partSeptaExplosion,50)
				part_particles_create(global.sys_above_gem,x,y,global.partSeptaExplosion2,5)
				for(i=0;i<=7;i++)
				{
					var lk = instance_create(MyBoard.x+32*7, MyBoard.y + 64*i, MyLightKiller)		
					var lek = instance_create(MyBoard.x+32*7, MyBoard.y + 64*i, MyLightObj)
					with(lek) {skinnum = other.skinnum; octa = true;}
					with(lk) skinnum = other.skinnum
				}
				#endregion
			}
			else if gempower = 4
			{
				#region gempower 4
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
					var lek = instance_create(x,y + (i-2)*64,MyLightKiller)
					with(lek) skinnum = other.skinnum
				
					if position_meeting(x - (i-2)*64,MyBoard.y+32*7,MyBoard) 
					{
						le[i] = instance_create(x - (i-2)*64,MyBoard.y+32*7,MyLightObj)
						with(le[i]) {skinnum = other.skinnum; image_angle = 90}
					}
					var lek = instance_create(x - (i-2)*64,y,MyLightKiller)
					with(lek) skinnum = other.skinnum
				}
				#endregion
			}
			else if gempower = 3
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
			        var lek = instance_create(x,y,MyLightKiller) 
					with(lek) skinnum = other.skinnum
					var lek = instance_create(x,y-64,MyLightKiller) 
					with(lek) skinnum = other.skinnum
					var lek = instance_create(x,y+64,MyLightKiller)
					with(lek) skinnum = other.skinnum
					var lek = instance_create(x-64,y,MyLightKiller) 
					with(lek) skinnum = other.skinnum
					var lek = instance_create(x+64,y,MyLightKiller) 
					with(lek) skinnum = other.skinnum
					#endregion
			    }
			else if gempower = 2
			    {
					#region gempower 2
					var le1 = noone;
					var le2 = noone;
			        audio_play_sound(snd_electro,1,false)
			        le1 = instance_create(MyBoard.x +32*7,y,MyLightObj)
			        le2 = instance_create(x,MyBoard.y +32*7,MyLightObj)
			        with(le2) image_angle += 90
			        with(le1) skinnum = other.skinnum
			        with(le2) skinnum = other.skinnum
			        var lek = instance_create(x,y,MyLightKiller)
					with(lek) skinnum = other.skinnum
					#endregion
			    }
			else if gempower = 1
			{
				explode(Gem_local)
			}
			#endregion
		}
		else if amLocked = 0 && skinnum = 7//if i am coal (and not doom)
		{
			#region coal
			instance_create(x,y,obj_coalnova)
			ds_list_delete(MyGamerule.list_of_coals,ds_list_find_index(MyGamerule.list_of_coals,id))
			var coal = instance_create(x,y,Coal_break)
			var dex = 0
			repeat(geodenum)
			{		
				var g = instance_create(x,y,geode)
				g.mycoal = coal
				g.myscore = geodenum_points[dex]
				dex++
			}
			#endregion	
		}

		if amexplode explode(MyGem)

		#region dissapearing gem, particles and collision
		if create_col {with(instance_position(x,y-64,MyGem)) {dont_fall_yet = true; alarm[7] = 10}}
		var diss = instance_create_depth(x,y,depth,MyDiss)
		with(diss) 
		{
			if other.cascade_diss
			{
				scaleplus = 0.08
			}
			
			if !other.anim_happening image_index = other.skinnum 
			else //put the anim sprite index instead of the spr_gems if its spinning
			{
				sprite_index = other.sprite_index
				image_index = other.image_index
			}
			
			if (other.dragXX != 0) || (other.make_inv_dis) image_alpha = 0
		}	

		if global.OPT_lightallowed
		{
			for(i=1;i<=10;i++)
			{
				xr = irandom_range(-32,32)
				yr = irandom_range(-32,32)
				part_particles_create(global.sys_below_gem,x+xr,y+yr,global.pr_gembreak,1)
			}
		}
		#endregion
		
	}
	else //if i am hypercube
	{
		#region Hypercube
		var cube = instance_create(x,y,obj_hypercube_detonate_local)
		cube.image_index = hyper_anim
		cube.index = skin_to_hype
		cube.gem[0] = gem_to_hype
		#endregion
	}

}
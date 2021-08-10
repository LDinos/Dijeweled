function scr_autosave() {
	ini_open("autosave_"+string(room_get_name(room)))
	var map = ds_map_create()
			//GEMS\\
				for(i=0;i<8;i++)
				{
					for(j=0;j<8;j++)
					{
						var str = string(i) + "-" + string(j)
						if gem_board1[i,j] != noone
						{
							ds_map_add(map,str+"skinnum", gem_board1[i,j].skinnum)
							ds_map_add(map,str+"gempower", gem_board1[i,j].gempower)
							ds_map_add(map,str+"amHype", gem_board1[i,j].amHype)
							ds_map_add(map,str+"amInvisible", gem_board1[i,j].amInvisible)
							ds_map_add(map,str+"amBomb", gem_board1[i,j].amBomb)
							ds_map_add(map,str+"amLocked", gem_board1[i,j].amLocked)
							ds_map_add(map,str+"amBeingLocked", gem_board1[i,j].amBeingLocked)
							ds_map_add(map,str+"countdown", gem_board1[i,j].countdown)
							ds_map_add(map,str+"amFruitExploding", gem_board1[i,j].amFruitExploding)
							ds_map_add(map,str+"geodenum", gem_board1[i,j].geodenum)
							for(var K=1; K<=gem_board1[i,j].geodenum;K++)
							{
								ds_map_add(map,str+"geodenum_points" + string(K), gem_board1[i,j].geodenum_points[K-1])
							}
						}
						else ds_map_add(map,str+"skinnum", -1)
					}
				}
			//POINTS AND LEVEL\\
				ds_map_add(map,"points", points)
				ds_map_add(map,"compliment_points", compliment_points)
				ds_map_add(map,"combo", combo)
				ds_map_add(map,"gemdestroyonemove", gemdestroyonemove)
				ds_map_add(map,"level", level)
				ds_map_add(map,"levelpointsneeded", levelpointsneeded)
				ds_map_add(map,"bomb_danger", bomb_danger)
				ds_map_add(map,"bomb_win", bomb_win)
				ds_map_add(map,"previous_points", previous_points)
				ds_map_add(map,"moves_made", Moves_Made)

			//XPLIER\\
				ds_map_add(map,"xplier", xplier)
				if instance_exists(obj_xplier)
				{
					ds_map_add(map,"fill_to_go", obj_xplier.fill_to_go)
					ds_map_add(map,"def_filler", obj_xplier.def_filler)
					ds_map_add(map,"xplier_real", obj_xplier.xplier_real)
				}
			
			//CHALLENGE\\
				if instance_exists(obj_bonus_challenge)
				{
					for(i=0;i<4;i++)
					{
						ds_map_add(map,"bonus"+string(i), obj_bonus_challenge.bonus[i])
					}
					ds_map_add(map,"bonus_index", obj_bonus_challenge.bonus_index)
					ds_map_add(map,"challenge_complete", obj_bonus_challenge.challenge_complete)
					ds_map_add(map,"sperm", obj_bonus_challenge.sperm)
				}
			//BOMB CONTROLS\\
				if instance_exists(obj_bombcontrol)
				{
					ds_map_add(map,"bomb_TurnsToSpawn", obj_bombcontrol.TurnsToSpawn)
					ds_map_add(map,"bomb_TurnsToSpawnCur", obj_bombcontrol.TurnsToSpawnCur)
					ds_map_add(map,"bomb_BombCounter", obj_bombcontrol.BombCounter)
				}
			//COAL CONTROLS\\
				if instance_exists(obj_coal_control)
				{
					ds_map_add(map,"coal_TurnsToSpawn", obj_coal_control.TurnsToSpawn)
					ds_map_add(map,"coal_TurnsToSpawnCur", obj_coal_control.TurnsToSpawnCur)
				}
			//LOCK CONTROLS\\
				if instance_exists(obj_lock_control)
				{
					ds_map_add(map,"lock_TurnsToSpawn", obj_lock_control.TurnsToSpawn)
					ds_map_add(map,"lock_TurnsToSpawnCur", obj_lock_control.TurnsToSpawnCur)
				}
			
			//LOCK CONTROLS\\
				if instance_exists(obj_ice_lock_control)
				{
					ds_map_add(map,"icelock_TurnsToSpawn", obj_ice_lock_control.TurnsToSpawn)
					ds_map_add(map,"icelock_TurnsToSpawnCur", obj_ice_lock_control.TurnsToSpawnCur)
				}
			//DOOM CONTROLS\\
				if instance_exists(obj_doom_control)
				{
					ds_map_add(map,"doom_DoomAlreadySpawnedOnce", obj_doom_control.DoomAlreadySpawnedOnce)
					ds_map_add(map,"doom_DoomCounter", obj_doom_control.DoomCounter)
				}
			//SEED\\
			var seed = random_get_seed()
					ds_map_add(map,"seed", seed)

			//BACKGROUND\\
					if instance_exists(obj_background_shadered)
					{
						ds_map_add(map,"shd", obj_background_shadered.shd)

					}
			//ZENIFY\\
				if instance_exists(obj_zenify)
				{
					ds_map_add(map,"zenify_index",obj_zenify.index)
				}
				var data = ds_map_write(map)	
				ini_write_string("map","data",data)
		
	ini_close()



}

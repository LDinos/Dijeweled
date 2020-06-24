///@desc save the current position of gems for the replay starting point
if !isReplayChecked && !isReplay
	{
		up_index = -1
		atm_points_needed = levelpointsneeded
		atm_points = points
		if instance_exists(obj_levelbar) atm_pre_points = obj_levelbar.previous_points
		if instance_exists(obj_bombcontrol)
		{
		Bomb_atm_TurnsToSpawn = obj_bombcontrol.TurnsToSpawn
		Bomb_atm_TurnsToSpawnCur = obj_bombcontrol.TurnsToSpawnCur
		Bomb_atm_BombCounter = obj_bombcontrol.BombCounter
		}
		if instance_exists(obj_lock_control)
		{
		Lock_atm_TurnsToSpawn = obj_lock_control.TurnsToSpawn
		Lock_atm_TurnsToSpawnCur = obj_lock_control.TurnsToSpawnCur
		}
		if instance_exists(obj_doom_control)
		{
		Doom_atm_DoomAlreadySpawnedOnce = obj_doom_control.DoomAlreadySpawnedOnce
		Doom_atm_DoomCounter = obj_doom_control.DoomCounter
		}
		for(i=0;i<8;i++)
		{
			up_index[i] = 0 //which row are we in? (7 + up_index)
			for(j=0;j<8;j++)
			{
				var key = string(i)+"-"+string(j)
				var gemtowrite = gem_board1[i,j]
				var skinnumtowrite;
				if gemtowrite = noone//!instance_exists(gemtowrite)
				{
					skinnumtowrite = -1
					//show_message("Error at replaysavepoint: " + string(i) + "-" + string(j))
				}
				else skinnumtowrite = gemtowrite.skinnum
				ds_map_add(Replay_map,key + "skin",skinnumtowrite)
				if skinnumtowrite != -1
				{
					ds_map_add(Replay_map,key + "amInv",gem_board1[i,j].amInvisible)
					ds_map_add(Replay_map,key + "power",gem_board1[i,j].gempower)
					ds_map_add(Replay_map,key + "amHype",gem_board1[i,j].amHype)
					ds_map_add(Replay_map,key + "amLocked",gem_board1[i,j].amLocked)
					ds_map_add(Replay_map,key + "amBeingLocked",gem_board1[i,j].amBeingLocked)
					ds_map_add(Replay_map,key + "amBomb",gem_board1[i,j].amBomb)
					ds_map_add(Replay_map,key + "countdown",gem_board1[i,j].countdown+1)
					ds_map_add(Replay_map,key + "geodenum",gem_board1[i,j].geodenum)
					for(var K = 1; K<=gem_board1[i,j].geodenum;K++)
					{
						ds_map_add(Replay_map,key + "geodenum_points"+string(K),gem_board1[i,j].geodenum_points[K-1])
					}
				}
			}
		}
	isReplayChecked = true
	}
	
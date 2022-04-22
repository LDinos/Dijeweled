///@desc save the current position of gems for the replay starting point
function replay_savepoint() {
	if !isReplayChecked && !isReplay
		{
			up_index = []
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
			for(var i=0;i<8;i++)
			{
				up_index[i] = 0 //which row are we in? (7 + up_index)
				for(var j=0;j<8;j++)
				{
					var key = string(i)+"-"+string(j)
					var gemtowrite = gems_id_fallen_array[i][j]
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
						ds_map_add(Replay_map,key + "amInv",gems_id_fallen_array[i][j].amInvisible)
						ds_map_add(Replay_map,key + "power",gems_id_fallen_array[i][j].gempower)
						ds_map_add(Replay_map,key + "amHype",gems_id_fallen_array[i][j].amHype)
						ds_map_add(Replay_map,key + "amLocked",gems_id_fallen_array[i][j].amLocked)
						ds_map_add(Replay_map,key + "amBeingLocked",gems_id_fallen_array[i][j].amBeingLocked)
						ds_map_add(Replay_map,key + "amBomb",gems_id_fallen_array[i][j].amBomb)
						ds_map_add(Replay_map,key + "countdown",gems_id_fallen_array[i][j].countdown+1)
						ds_map_add(Replay_map,key + "geodenum",gems_id_fallen_array[i][j].geodenum)
						for(var K = 1; K<=gems_id_fallen_array[i][j].geodenum;K++)
						{
							ds_map_add(Replay_map,key + "geodenum_points"+string(K),gems_id_fallen_array[i][j].geodenum_points[K-1])
						}
					}
				}
			}
		isReplayChecked = true
		}
}

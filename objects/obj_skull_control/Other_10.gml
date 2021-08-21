/// @description Decrease spawn counter value (if 0, it spawns bombs)
if (ds_list_size(Gamerule_1.list_of_skulls) + instance_number(skullAppear)) < SkullMax
{
	if !SkullSpawnInstant
	{
		if !SkullAlreadySpawnedOnce
		{
			if !TurnsToSpawnRandom
			{
				if SkullSpawnLevelMin <= Gamerule_1.level
				{
					if ((obj_score.scoretemp-obj_levelbar.previous_points)/(Gamerule_1.levelpointsneeded-obj_levelbar.previous_points)) >= SkullSpawnAt
					{
						if !Gamerule_1.isReplay 
						{
							spawn_lock("Skull")
							SkullAlreadySpawnedOnce = true
						}
					}
				}
			}
			else
			{
				var r = irandom(99)
				if r <= TurnsToSpawnChance
				{
					if (SkullSpawnLevelMin <= Gamerule_1.level)
					{
						if !Gamerule_1.isReplay
						{
							spawn_lock("Skull")
							SkullAlreadySpawnedOnce = true
						}
					}
				}
			}
		}
	}
	else
	{
		if !instance_exists(skullAppear)
		{
			if !Gamerule_1.isReplay
			{
				spawn_lock("Skull")
			}
		}
	}
}
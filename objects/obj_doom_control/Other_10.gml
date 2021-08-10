/// @description Decrease spawn counter value (if 0, it spawns bombs)
if !DoomSpawnInstant
{
	if !DoomAlreadySpawnedOnce
	{
		if !TurnsToSpawnRandom
		{
			if DoomSpawnLevelMin <= Gamerule_1.level
			{
				if ((obj_score.scoretemp-obj_levelbar.previous_points)/(Gamerule_1.levelpointsneeded-obj_levelbar.previous_points)) >= DoomSpawnAt
				{
					if !Gamerule_1.isReplay 
					{
						spawn_lock("doom")
						DoomAlreadySpawnedOnce = true
					}
				}
			}
		}
		else
		{
			var r = irandom(99)
			if r <= TurnsToSpawnChance
			{
				if (DoomSpawnLevelMin <= Gamerule_1.level)
				{
					if !Gamerule_1.isReplay
					{
						spawn_lock("doom")
						DoomAlreadySpawnedOnce = true
					}
				}
			}
		}
	}
}
else
{
	if Gamerule_1.list_of_doom = noone && !instance_exists(doom_settling) && !instance_exists(doomAppear)
	{
		if !Gamerule_1.isReplay
					{
						spawn_lock("doom")
					}
	}
}
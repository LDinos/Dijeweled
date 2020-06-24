/// @description Level change
if !TurnsToSpawnRandom
{
	if TurnsToSpawnLevelBased
	{
		if TurnsToSpawnLevelBasedEnd < Gamerule_1.level
		{
			TurnsToSpawn = TurnsToSpawnDefault + CoalSpawnLevelMin - Gamerule_1.level
		}
	}

	TurnsToSpawnCur = TurnsToSpawn
}
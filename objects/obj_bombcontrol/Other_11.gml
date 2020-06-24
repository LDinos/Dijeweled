/// @description Level change
if TurnsToSpawnLevelBased
{
	if TurnsToSpawnLevelBasedEnd > Gamerule_1.level
	{
		TurnsToSpawn = TurnsToSpawnDefault + BombSpawnLevelMin - Gamerule_1.level
	}
	else TurnsToSpawn = TurnsToSpawnDefault + BombSpawnLevelMin - TurnsToSpawnLevelBasedEnd
}

if BombCounterLevelBased
{
	if BombCounterLevelBasedEnd > Gamerule_1.level
	{
		BombCounter = BombCounterDefault + BombSpawnLevelMin - Gamerule_1.level
	}
	else BombCounter = BombCounterDefault + BombSpawnLevelMin - BombCounterLevelBasedEnd
}

TurnsToSpawnCur = TurnsToSpawn
ExaggerateOnce = false
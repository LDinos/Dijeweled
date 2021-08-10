/// @description Level change
SkullAlreadySpawnedOnce = false
if SkullCounterLevelBased
{
	if SkullCounterLevelBasedEnd > Gamerule_1.level
	{
		SkullCounter = SkullCounterDefault + SkullSpawnLevelMin - Gamerule_1.level
	}
	else SkullCounter = SkullCounterDefault + SkullSpawnLevelMin - SkullCounterLevelBasedEnd
}
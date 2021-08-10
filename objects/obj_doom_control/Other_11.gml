/// @description Level change
DoomAlreadySpawnedOnce = false
if DoomCounterLevelBased
{
	if DoomCounterLevelBasedEnd > Gamerule_1.level
	{
		DoomCounter = DoomCounterDefault + DoomSpawnLevelMin - Gamerule_1.level
	}
	else DoomCounter = DoomCounterDefault + DoomSpawnLevelMin - DoomCounterLevelBasedEnd
}
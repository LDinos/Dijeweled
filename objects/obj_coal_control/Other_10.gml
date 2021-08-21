/// @description Decrease spawn counter value (if 0, it spawns bombs)
if !TurnsToSpawnRandom
{
	if TurnsToSpawnCur > 0 TurnsToSpawnCur--
	if (TurnsToSpawnCur = 0) && (ds_list_size(Gamerule_1.list_of_coals) < CoalMax)
	{
		if CoalSpawnLevelMin <= Gamerule_1.level
		{
			with(spawner1) coalspawn = true //tell spawner to spawn coal
			TurnsToSpawnCur = TurnsToSpawn
		}
	}
}
else
{
	var r = irandom(99)
	if r <= TurnsToSpawnChance
	{
		if (CoalSpawnLevelMin <= Gamerule_1.level) && (ds_list_size(Gamerule_1.list_of_coals) < CoalMax)
		{
			with(spawner1) coalspawn = true //tell spawner to spawn coal
		}
	}
}
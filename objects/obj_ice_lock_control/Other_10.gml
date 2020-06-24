/// @description Decrease spawn counter value (if 0, it spawns bombs)
if !TurnsToSpawnRandom
{
	if TurnsToSpawnCur > 0 TurnsToSpawnCur--
	if (TurnsToSpawnCur = 0) && (ds_list_size(Gamerule_1.list_of_ice_locks) + instance_number(iceAppear) < LockMax)
	{
		if LockSpawnLevelMin <= Gamerule_1.level
		{
			TurnsToSpawnCur = TurnsToSpawn
			if !Gamerule_1.isReplay spawn_lock("ice")
		}
	}
}
else
{
	var r = irandom(99)
	if r <= TurnsToSpawnChance
	{
		if (LockSpawnLevelMin <= Gamerule_1.level) && (ds_list_size(Gamerule_1.list_of_ice_locks) + instance_number(iceAppear) < LockMax)
		{
			if !Gamerule_1.isReplay spawn_lock("ice")
		}
	}
}
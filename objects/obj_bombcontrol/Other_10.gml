/// @description Decrease spawn counter value (if 0, it spawns bombs)
if TurnsToSpawnCur > 0 TurnsToSpawnCur--
if TurnsToSpawnCur = 0 && ds_list_size(Gamerule_1.list_of_bombs) < BombMax
{
	if BombSpawnLevelMin <= Gamerule_1.level
	{
		with(spawner1) bombspawn = other.BombCounter //tell spawner to spawn bomb with this counter
		var m = 1
		if BombExaggerate > -1
		{
			
			if !Gamerule_1.time_allowed
			{
				var pointstoreach = 100*(obj_score.scoretemp-obj_levelbar.previous_points)/(Gamerule_1.levelpointsneeded-obj_levelbar.previous_points)
				if (pointstoreach >= BombExaggerate) m = 1/3
			}
		}
		TurnsToSpawnCur = floor(TurnsToSpawn * m)
	}
}
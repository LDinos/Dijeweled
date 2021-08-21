/// @description Insert description here
// You can write your code in this editor
if !Gamerule_1.time_allowed && BombExaggerate != -1
{
	var pointstoreach = 100*(obj_score.scoretemp-obj_levelbar.previous_points)/(Gamerule_1.levelpointsneeded-obj_levelbar.previous_points)
	if !ExaggerateOnce && BombSpawnLevelMin <= Gamerule_1.level
	{
		if (pointstoreach >= BombExaggerate)
		{
			ExaggerateOnce = true
			with(spawner1) bombspawn = other.BombCounter
			TurnsToSpawnCur = 1
		}
	}
}

if Gamerule_1.swap_happened
{
	//show_message("bomb damn")
	event_user(0)
}
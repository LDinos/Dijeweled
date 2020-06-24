room_speed = 60
draw_texture_flush()
with(Gamerule_1)
{
	replay_allowed = false
	points_allowed = false
	levelcompleteallowed = false
	isQuest = false
}


	with(obj_doom_control)
	{
		DoomSpawnInstant = true
		DoomCounterLevelBased = false
		if Gamerule_1.Moves_Made == 0 DoomCounterDefault = 8 //The value to give to the newly spawned Doom
		if Gamerule_1.Moves_Made == 0 DoomCounter = DoomCounterDefault //The value to give to the newly spawned Doom
	}
	with(obj_bombcontrol)
	{
		if Gamerule_1.Moves_Made == 0 TurnsToSpawnDefault = 8
		if Gamerule_1.Moves_Made == 0 TurnsToSpawn = TurnsToSpawnDefault; //After how many turns will a bomb spawn? This changes every level if it is level based.
		if Gamerule_1.Moves_Made == 0 TurnsToSpawnCur = TurnsToSpawn //This gets decreased every turn. after going to 0, it becomes TurnsToSpawn again.
		BombCounterLevelBased = true //Is the counter of the bombs a level based variable?
		if Gamerule_1.Moves_Made == 0 BombCounterLevelBasedEnd = 15 //After which level do we stop changing the bomb counter value?
		if Gamerule_1.Moves_Made == 0 BombCounterDefault = 20 //The value to give to the newly spawned bomb
		if Gamerule_1.Moves_Made == 0 BombCounter = BombCounterDefault //The value to give to the newly spawned bomb
		BombSpawnLevelMin = 1 //When do we start allowing bombs to spawn? (-1 = infinite)
		if Gamerule_1.Moves_Made == 0 BombMax = 3 //Max amount of bombs on screen
		BombExaggerate = -1
	}
discord_update_presence(global.DIS_name,"Moves: " + string(Gamerule_1.Moves_Made),"ico_512","")
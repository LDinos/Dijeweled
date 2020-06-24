/// @description Insert description here
TurnsToSpawnLevelBased = true //Does the variable turntospawn consist of the level variable?
TurnsToSpawnLevelBasedEnd = 9 //After which level do we stop changing the turns to spawn value?
BombSpawnLevelMin = 2 //When do we start allowing bombs to spawn? (-1 = infinite)
BombSpawnLevelMax = -1 //When do we stop allowing bombs? (-1 = infinite)
TurnsToSpawnDefault = 10
TurnsToSpawn = TurnsToSpawnDefault; //After how many turns will a bomb spawn? This changes every level if it is level based.
TurnsToSpawnCur = TurnsToSpawn //This gets decreased every turn. after going to 0, it becomes TurnsToSpawn again.
BombCounterLevelBased = true //Is the counter of the bombs a level based variable?
BombCounterLevelBasedEnd = 15 //After which level do we stop changing the bomb counter value?
BombCounterDefault = 20 //The value to give to the newly spawned bomb
BombCounter = BombCounterDefault //The value to give to the newly spawned bomb
BombMax = 4 //Max amount of bombs on screen
ExaggerateOnce = false
BombExaggerate = 65 //Make bombs spawn in less time (1/3 of turns to spawn). -1 = disabled, 0-100 percent of bar to pass to enable it
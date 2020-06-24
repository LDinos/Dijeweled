/// @description Insert description here

LockSpawnLevelMin = 1//10 //When do we start allowing coals to spawn? (-1 = infinite)
LockSpawnLevelMax = -1 //When do we stop allowing coals? (-1 = infinite)

/*1*/TurnsToSpawnRandom = false //Is the turns to spawn randomized? If so, it wont be levelbased
	TurnsToSpawnChance = 1 //if above is true, what is the chance out of 100 to spawn?
/*2*/TurnsToSpawnLevelBased = true //Does the variable turntospawn consist of the level variable?
	TurnsToSpawnLevelBasedEnd = 14 //After which level do we stop changing the turns to spawn value?
	TurnsToSpawnDefault = 15
	TurnsToSpawn = 15; //After how many turns will a coal spawn? This changes every level if it is level based.
	TurnsToSpawnCur = TurnsToSpawn //This gets decreased every turn. after going to 0, it becomes TurnsToSpawn again.
LockMax = 5 //Max amount of locks on screen
/// @description Insert description here

CoalSpawnLevelMin = 2 //When do we start allowing coals to spawn? (-1 = infinite)
CoalSpawnLevelMax = -1 //When do we stop allowing coals? (-1 = infinite)

/*1*/TurnsToSpawnRandom = true //Is the turns to spawn randomized? If so, it wont be levelbased
	TurnsToSpawnChance = 1 //if above is true, what is the chance out of 100 to spawn?
/*2*/TurnsToSpawnLevelBased = false //Does the variable turntospawn consist of the level variable?
	TurnsToSpawnLevelBasedEnd = 10 //After which level do we stop changing the turns to spawn value?
	TurnsToSpawnDefault = 15 //first ever default value
	TurnsToSpawn = 15; //After how many turns will a coal spawn? This changes every level if it is level based.
	TurnsToSpawnCur = TurnsToSpawn //This gets decreased every turn. after going to 0, it becomes TurnsToSpawn again.
CoalMax = 5 //Max amount of coals on screen
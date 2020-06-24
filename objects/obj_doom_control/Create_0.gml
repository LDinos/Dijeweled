/// @description Insert description here

DoomSpawnLevelMin = 13 //When do we start allowing dooms to spawn? (-1 = infinite)
DoomSpawnLevelMax = -1 //When do we stop allowing dooms? (-1 = infinite)

DoomAlreadySpawnedOnce = false //has a doom gem spawned in this level? We can only have one doom per level
/*1*/ DoomSpawnAt = 0.4 //After what percent of the level bar should a doom spawn
/*2*/ TurnsToSpawnRandom = false //After what chance should a doom spawn?
	  TurnsToSpawnChance = 1 //if above is true, what is the chance
DoomSpawnInstant = false //Should it spawn every time it gets destroyed?

DoomCounterLevelBased = true //Is the counter of the Dooms a level based variable?
DoomCounterLevelBasedEnd = 23 //After which level do we stop changing the Doom counter value?
DoomCounterDefault = 20 //The value to give to the newly spawned Doom
DoomCounter = DoomCounterDefault //The value to give to the newly spawned Doom

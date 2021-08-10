/// @description Insert description here

SkullSpawnLevelMin = -1 //When do we start allowing Skulls to spawn? (-1 = infinite)
SkullSpawnLevelMax = -1 //When do we stop allowing Skulls? (-1 = infinite)

SkullAlreadySpawnedOnce = false //has a Skull gem spawned in this level? We can only have one Skull per level
/*1*/ SkullSpawnAt = 0.4 //After what percent of the level bar should a Skull spawn
/*2*/ TurnsToSpawnRandom = false //After what chance should a Skull spawn?
	  TurnsToSpawnChance = 1 //if above is true, what is the chance
SkullSpawnInstant = true //Should it spawn every time it gets destroyed?

SkullCounterLevelBased = true //Is the counter of the Skulls a level based variable?
SkullCounterLevelBasedEnd = 23 //After which level do we stop changing the Skull counter value?
SkullCounterDefault = 5 //The value to give to the newly spawned Skull
SkullCounter = SkullCounterDefault //The value to give to the newly spawned Skull
SkullMax = 3

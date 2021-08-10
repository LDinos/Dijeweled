/// @description Insert description here
hover = -1
xx = 0
yy = 0

#region make info
var i = 0
info[i,0] = "gemsare0"; info[i,1] = "Goal that gets triggered when there are no more gems on board"
i++
info[i,0] = "summoves"; info[i,1] = "This Goal counts the number of possible matches on board"
i++
info[i,0] = "cascades"; info[i,1] = "This Goal counts the number of cascades in the last move"
i++
info[i,0] = "destroy_fruits"; info[i,1] = "This Goal counts the total number of activated Fruits"
i++
info[i,0] = "destroy_hype"; info[i,1] = "This Goal counts the total number of triggered Hypercubes"
i++
info[i,0] = "destroy_locks"; info[i,1] = "This Goal counts the total number of destroyed Locks"
i++
info[i,0] = "destroy_bombs"; info[i,1] = "This Goal counts the total number of destroyed Bombs"
i++
info[i,0] = "destroy_skulls"; info[i,1] = "This Goal counts the total number of destroyed Skulls"
i++
info[i,0] = "destroy_dooms"; info[i,1] = "This Goal counts the total number of destroyed Doom Gems"
i++
info[i,0] = "destroy_ice"; info[i,1] = "This Goal counts the total number of destroyed Ice"
i++
info[i,0] = "destroy_coals"; info[i,1] = "This Goal counts the total number of destroyed Coals"
i++
info[i,0] = "destroy_gems"; info[i,1] = "This Goal counts the total number of destroyed gems. \nNOTE: Gems that become powered don't count unlike in 'match_gems'\n(a 4-match will result in 3 cleared gems)"
i++
info[i,0] = "match_gems"; info[i,1] = "This Goal counts the total number of gems that got matched"
i++
info[i,0] = "destroy_flame"; info[i,1] = "This Goal counts the total number of triggered Flame Gems"
i++
info[i,0] = "destroy_lightning"; info[i,1] = "This Goal counts the total number of destroyed Lightning Gems"
i++
info[i,0] = "destroy_nova"; info[i,1] = "This Goal counts the total number of destroyed Supernovas"
i++
info[i,0] = "destroy_septa"; info[i,1] = "This Goal counts the total number of destroyed Septanovas"
i++
info[i,0] = "destroy_octa"; info[i,1] = "This Goal counts the total number of destroyed Octanovas"
i++
info[i,0] = "num_green"; info[i,1] = "This Goal counts the current number of Green Gems on board"
i++
info[i,0] = "num_red"; info[i,1] = "This Goal counts the current number of Red Gems on board"
i++
info[i,0] = "num_blue"; info[i,1] = "This Goal counts the current number of Blue Gems on board"
i++
info[i,0] = "num_yellow"; info[i,1] = "This Goal counts the current number of Yellow Gems on board"
i++
info[i,0] = "num_white"; info[i,1] = "This Goal counts the current number of White Gems on board"
i++
info[i,0] = "num_purple"; info[i,1] = "This Goal counts the current number of Purple Gems on board"
i++
info[i,0] = "num_orange"; info[i,1] = "This Goal counts the current number of Orange Gems on board"
i++
info[i,0] = "num_coals"; info[i,1] = "This Goal counts the current number of Coals on board"
i++
info[i,0] = "num_flame"; info[i,1] = "This Goal counts the total number of created Flame Gems"
i++
info[i,0] = "num_lightning"; info[i,1] = "This Goal counts the total number of created Lightnings"
i++
info[i,0] = "num_nova"; info[i,1] = "This Goal counts the total number of created Supernovas"
i++
info[i,0] = "num_septa"; info[i,1] = "This Goal counts the total number of created Septanovas"
i++
info[i,0] = "num_octa"; info[i,1] = "This Goal counts the total number of created Octanovas"
i++
info[i,0] = "num_hype"; info[i,1] = "This Goal counts the total number of created Hypercubes"
i++
info[i,0] = "num_points"; info[i,1] = "This Goal reads the total points the Player has"
i++
info[i,0] = "num_fruits"; info[i,1] = "This Goal counts the total number of acquired Fruits \n(= How many times the Player finished rainbow x10)"
i++
info[i,0] = "num_zenifycombo"; info[i,1] = "This Goal reads the total points from Zenify combos"
i++
info[i,0] = "num_chain"; info[i,1] = "This Goal reads the latest consecutive match streak"
i++
info[i,0] = "pattern"; info[i,1] = "This Goal sets a board pattern that the Player must simulate to win"
i++
info[i,0] = "movesneeded"; info[i,1] = "A Goal that gets completed when this amount of moves are made"

i=0
info[42+i,0] = "nolightning"; info[42+i,1] = "A condition that resets all stats if any Lightning is activated"
i++
info[42+i,0] = "onemove"; info[42+i,1] = "A condition that resets stats when a gem is swapped"
i++
info[42+i,0] = "movesleft"; info[42+i,1] = "Making this amount of moves results in a loss"
i++
info[42+i,0] = "drain_score"; info[42+i,1] = "Constantly drains the score, resulting in a loss if it reaches zero"
i++
info[42+i,0] = "nospecials"; info[42+i,1] = "A condition that resets all stats if Special Gems are detonated"
i++
#endregion
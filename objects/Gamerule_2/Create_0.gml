/// @description All rules are here. This controls time, conditions, when to check for matches etc etc.
//gem_board1 = gem id's
//gemboard = gem skins (fallen down)
//gems_fallen = gem ids fallen down
inverted_swaps = false
horizontal_swaps_only = false
vertical_swaps_only = false
xplier = 1
matches = 0
Moves_Made = 0
points = 0
style = 0
compliment_points = 0
combo = 0
gemdestroyonemove =0;
moving = false
lightOn = false //is a star gem currently being triggered?
hypeOn = false //is a hypercube currently being triggered?
fruit_exploding_dontmove = false
flameon = false
if global.online
{
	GEM_ID = -1 //a list that fits 64 gems, so online multiplayer can have ids for each enemy gem
	for (var i = 0; i < 64; i++) {GEM_ID[i] = -1}
}
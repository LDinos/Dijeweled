/// @description Spawn same gems to the other board
var gemtype, boardtype;
gemtype = Gem_2
boardtype = Board_2
if !global.online {gemtype = Gem_local; boardtype = Board_local}
if (!global.spectator) initial_spawn(gemtype, boardtype, Gamerule_2)
else {
	initial_spawn(Gem_2, spectator_get_board(0), Gamerule_1, 0)
	initial_spawn(Gem_2, spectator_get_board(1), Gamerule_2, 1)
}

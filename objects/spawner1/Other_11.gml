/// @description Spawn same gems to the other board
var gemtype, boardtype;
gemtype = Gem_2
boardtype = Board_2
if !global.online {
	gemtype = Gem_local; 
	boardtype = Board_local
	for(var i=0;i<=global.board_rows-1;i++)
{
	for(var j=0;j<=7;j++)
	{
		var x1 = boardtype.x + 64*j
		var y1 = boardtype.y - 64*(i+1)
		var myskin = gem_array[i,j]
		var G = instance_create_depth(x1, y1,-1,gemtype) 
		with(G) 
		{
			set_skin(myskin)
		}
	}
}
}
else {
	if (!global.spectator) initial_spawn(gemtype, boardtype, Gamerule_2)
	else {
		initial_spawn(Gem_2, spectator_get_board(0), Gamerule_1, 0)
		initial_spawn(Gem_2, spectator_get_board(1), Gamerule_2, 1)
	}
}

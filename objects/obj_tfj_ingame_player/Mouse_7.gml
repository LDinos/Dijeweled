with (obj_tfj_ingame_player) { image_index=0 }
image_index=1

//change gem sprites
for (var i=0;i<8;i++)
{
	for (var j=0;j<8;j++)
	{
		Gamerule_1.gem_board1[i][j].image_index =  board[i][j]
	}
}

if (is_me)
{
    Gamerule_1.controlallowed = true
	exit
}
Gamerule_1.controlallowed = false

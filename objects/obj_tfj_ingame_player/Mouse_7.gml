with (obj_tfj_ingame_player) { image_index=0 }
image_index=1
var k=0
for (var i=0;i<8;i++)
{
	for (var j=0;j<8;j++)
	{
		spawner1_tfj.g_a[k].image_index = board[i][j]
		k++
	}
}




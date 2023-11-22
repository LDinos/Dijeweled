name = ""
hp = 100
lvl = 1
board = [[0,0,0,0,0,0,0,0],[0,0,0,0,0,0,0,0],[0,0,0,0,0,0,0,0],[0,0,0,0,0,0,0,0],[0,0,0,0,0,0,0,0],[0,0,0,0,0,0,0,0],[0,0,0,0,0,0,0,0],[0,0,0,0,0,0,0,0]]
gold = 0
placement = 0
_score = 0
image_speed = 0

function setName (nm)
{
	name=nm
	if(obj_tfj_ingame_renderer.my_player() == id) name+= " (you)"
}

function selectPlayer()
{
	with (obj_tfj_ingame_player) { image_index=0 }
	image_index=1
	for (var i=0;i<8;i++)
	{
		for (var j=0;j<8;j++)
		{
			Gamerule_1.gem_board1[i][j].image_index =  board[i][j]
		}
	}
}
name = ""
hp = 100
lvl = 1
is_me=false
board = [[0,0,0,0,0,0,0,0],[0,0,0,0,0,0,0,0],[0,0,0,0,0,0,0,0],[0,0,0,0,0,0,0,0],[0,0,0,0,0,0,0,0],[0,0,0,0,0,0,0,0],[0,0,0,0,0,0,0,0],[0,0,0,0,0,0,0,0]]
gold = 0
image_speed = 0

function setName (nm)
{
	name=nm
	if(is_me) name+= " (you)"
}

function selectPlayer()
{
	for (var i=0;i<8;i++)
	{
		for (var j=0;j<8;j++)
		{
			Gamerule_1.gem_board1[i][j].image_index =  board[i][j]
		}
	}
}
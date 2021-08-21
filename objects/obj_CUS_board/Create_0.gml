/// @description Insert description here
image_speed = 0
gem_selection = 0 //0-6 gem, colors, 7 = coal
//board set: 8 = hypercube, -1 is noone, 10+ = flame, 20+ = lightning, 30+ = nova, 40+ = septa, 50+ octa, 60+ = lock
allowed = CUS_general_spawn.enabled
board = ds_grid_create(8,8)
for(var i =0; i<8; i++)
{
	for(var j =0; j<8; j++)
	{
		board[# i,j] = -1
	}
}

var filename = obj_CUS_general.filename
if file_exists(filename)
{
	ini_open(filename)
		var s = "Board"
		var str = ini_read_string(s,"board","")
		ds_grid_read(board,str)
	ini_close()
}
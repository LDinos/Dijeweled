/// @function script()
/// @description default
/// @param {type} param first parameter
function gameover_update_stats(level_included){
ini_open("Stats/"+global.STATS_file)
//1	//Read stuff
	var stats_board = ds_grid_create(10,3)
	var str = ini_read_string("Data","grid","")
	ds_grid_read(stats_board,str)
	title = ini_read_string("Title","value","Untitled")
	
//2	//Compare my score with the stats-score, starting from the top player
	myplace = -1
	for(var i = 0; i <10;i++)
	{
		if (global.STATS_points >= stats_board[# i, 1]) //if my points are bigger...
		{
			myplace = i //...save that place number
			//show_message("this needs to happen only once")
			break;
		}
		if (global.STATS_points == stats_board[# i, 1]) && level_included //else if points are same...
		{
			if (global.STATS_level >= stats_board[# i, 2]) //...check if we reached a better/equal level
			{
				myplace = i
				break;
			}
		}
	}
//3 //Now, lets overwrite stats if needed	
	if myplace != -1 //if I am in the top 10
	{
		if (myplace < 9) //if I ain't last, check if we have to 'drop-down-one-place' some stats.
		{
			for(var i = 8; i>=myplace; i--) //drop each stat one place down, beggining from the semifinal stat (9th/10th)
			{								//we begin from the 9th place because the 10th place will surely get eliminated.
				var ii = i+1
				stats_board[# ii, 0] = stats_board[# i, 0] //transfer the name down (eg: from 9th place to 10th place, then from 8th to 9th, and so on)
				stats_board[# ii, 1] = stats_board[# i, 1] //transfer the score down
				if (level_included) stats_board[# ii, 2] = stats_board[# i, 2]
			}
		}
	
	//4	//now transfer myself on the stats, using the variable that we made when comparing
		stats_board[# myplace, 0] = global.user
		stats_board[# myplace, 1] = global.STATS_points
		if (level_included) stats_board[# myplace, 2] = global.STATS_level
	//5	//write the new stats board in the text file
		var str = ds_grid_write(stats_board)
		ini_write_string("Data","grid",str)
	}
	ds_grid_destroy(stats_board)
ini_close()
}
/// @description Stats in main menu
global.STATS_file = "stats_buyo.ini"
if !file_exists(global.STATS_file)
{
	stats_create_buyo()
}


ini_open(global.STATS_file)

//show_message("asdsad")
//1	//Read stuff
	stats_board = ds_grid_create(10,3)
	var str = ini_read_string("Data","grid","")
	ds_grid_read(stats_board,str)
	title = ini_read_string("Title","value","Untitled")
		
ini_close()
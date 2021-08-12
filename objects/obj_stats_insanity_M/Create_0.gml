/// @description Stats in main menu
global.STATS_file = "stats_insanity.ini"
if !file_exists(global.STATS_file)
{
	switch(global.STATS_file)
	{
		case "stats_arcade.ini":
			stats_create_arcade()
			break;
		case "stats_swift.ini":
			stats_create_swift()
			break;
		case "stats_classic.ini":
			stats_create_classic()
			break;
		case "stats_compact.ini":
			stats_create_compact()
			break;
		case "stats_twist.ini":
			stats_create_twist()
			break;
		case "stats_blitz.ini":
			stats_create_blitz()
			break;
		case "stats_survivor.ini":
			stats_create_survivor()
			break;
		case "stats_insanity.ini":
			stats_create_insanity()
			break;
	}
}


ini_open(global.STATS_file)

//show_message("asdsad")
//1	//Read stuff
	stats_board = ds_grid_create(10,3)
	var str = ini_read_string("Data","grid","")
	ds_grid_read(stats_board,str)
	title = ini_read_string("Title","value","Untitled")
		
ini_close()
/// @description
show_personal = false //Is this an object after a gameover (true) or seen through the menu stats (false)?
stats_index = 0 //Menu only, the current array index for the gamemode to show stats from
has_level = true //Do the stats include level information
stats_array = ["stats_arcade.ini", "stats_swift.ini", "stats_classic.ini", "stats_countdown.ini",
				"stats_compact.ini", "stats_twist.ini", "stats_blitz60.ini",
				"stats_blitz180.ini", "stats_blitz300.ini","stats_survivor.ini", "stats_buyo.ini"]
		
function open_stats() {
	if !file_exists("Stats/"+global.STATS_file) //create stats for first time
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
			case "stats_blitz60.ini":
				global.timer = 60
				stats_create_blitz()
				break;
			case "stats_blitz180.ini":
				global.timer = 180
				stats_create_blitz()
				break;
			case "stats_blitz300.ini":
				global.timer = 300
				stats_create_blitz()
				break;
			case "stats_survivor.ini":
				stats_create_survivor()
				break;
			case "stats_countdown.ini":
				stats_create_countdown()
				break;
			case "stats_buyo.ini":
				stats_create_buyo()
				break;
		}
	}

	ini_open("Stats/"+global.STATS_file)
		stats_board = ds_grid_create(10,3)
		var str = ini_read_string("Data","grid","")
		ds_grid_read(stats_board,str)
		title = ini_read_string("Title","value","Untitled")
		has_level = ini_read_string("Info","has_level",false)
	ini_close()

	my_place = -1; //What place am I in these stats (only relevant after a gameover and not on menu stats)
	if (show_personal) for(var i = 0; i <10;i++) {
		var conditions_met = 0
		if (global.STATS_points == stats_board[# i, 1]) conditions_met++
		if (!has_level) conditions_met++
		else if (global.STATS_level == stats_board[# i, 2]) conditions_met++
		if (conditions_met == 2) {
			my_place = i
			break;
		}
	}
	
}


#region drawing variables
box_title_width = 160 //Gamemode Title box
box_title_height = 32
box_width = 448 //Stats box
box_height = 320
box_no_percentage = 0.1 //percentage of box width that the title "No." takes
box_name_percentage = 0.5 //percentage of box width that the title "Name" takes
box_score_percentage = 0.8 //percentage of box width that the title "Score" takes
#endregion
function stats_create_blitz() {
<<<<<<< HEAD
	var grid = ds_grid_create(10,2)
	if global.timer == 60
	{
		var i = 0;
		grid[# i,0] = "Dinosaur"; grid[# i,1] = 50000
		i++
		grid[# i,0] = "Jason"; grid[# i,1] = 32000
		i++
		grid[# i,0] = "Helen"; grid[# i,1] = 25000
		i++
		grid[# i,0] = "Peter"; grid[# i,1] = 20000
		i++
		grid[# i,0] = "Mike"; grid[# i,1] = 10000
		i++
		grid[# i,0] = "Lucas"; grid[# i,1] = 8000
		i++
		grid[# i,0] = "Tom"; grid[# i,1] = 6000
		i++
		grid[# i,0] = "Joanna"; grid[# i,1] = 5000
		i++
		grid[# i,0] = "Mason"; grid[# i,1] = 3000
		i++
		grid[# i,0] = "Bob"; grid[# i,1] = 1000
=======
	var grid = ds_grid_create(10,3)
	if global.timer == 60
	{
		var i = 0;
		grid[# i,0] = "Dinosaur"; grid[# i,1] = 50000; grid[# i,2] = -1
		i++
		grid[# i,0] = "Jason"; grid[# i,1] = 32000; grid[# i,2] = -1
		i++
		grid[# i,0] = "Helen"; grid[# i,1] = 25000; grid[# i,2] = -1
		i++
		grid[# i,0] = "Peter"; grid[# i,1] = 20000; grid[# i,2] = -1
		i++
		grid[# i,0] = "Mike"; grid[# i,1] = 10000; grid[# i,2] = -1
		i++
		grid[# i,0] = "Lucas"; grid[# i,1] = 8000; grid[# i,2] = -1
		i++
		grid[# i,0] = "Tom"; grid[# i,1] = 6000; grid[# i,2] = -1
		i++
		grid[# i,0] = "Joanna"; grid[# i,1] = 5000; grid[# i,2] = -1
		i++
		grid[# i,0] = "Mason"; grid[# i,1] = 3000; grid[# i,2] = -1
		i++
		grid[# i,0] = "Bob"; grid[# i,1] = 1000; grid[# i,2] = -1
>>>>>>> 1.9
		i++
	}
	else if global.timer == 180
	{
		var i = 0;
<<<<<<< HEAD
		grid[# i,0] = "Dinosaur"; grid[# i,1] = 180000
		i++
		grid[# i,0] = "Jason"; grid[# i,1] = 140000
		i++
		grid[# i,0] = "Helen"; grid[# i,1] = 100000
		i++
		grid[# i,0] = "Peter"; grid[# i,1] = 80000
		i++
		grid[# i,0] = "Mike"; grid[# i,1] = 60000
		i++
		grid[# i,0] = "Lucas"; grid[# i,1] = 50000
		i++
		grid[# i,0] = "Tom"; grid[# i,1] = 40000
		i++
		grid[# i,0] = "Joanna"; grid[# i,1] = 30000
		i++
		grid[# i,0] = "Mason"; grid[# i,1] = 15000
		i++
		grid[# i,0] = "Bob"; grid[# i,1] = 10000
=======
		grid[# i,0] = "Dinosaur"; grid[# i,1] = 180000; grid[# i,2] = -1
		i++
		grid[# i,0] = "Jason"; grid[# i,1] = 140000; grid[# i,2] = -1
		i++
		grid[# i,0] = "Helen"; grid[# i,1] = 100000; grid[# i,2] = -1
		i++
		grid[# i,0] = "Peter"; grid[# i,1] = 80000; grid[# i,2] = -1
		i++
		grid[# i,0] = "Mike"; grid[# i,1] = 60000; grid[# i,2] = -1
		i++
		grid[# i,0] = "Lucas"; grid[# i,1] = 50000; grid[# i,2] = -1
		i++
		grid[# i,0] = "Tom"; grid[# i,1] = 40000; grid[# i,2] = -1
		i++
		grid[# i,0] = "Joanna"; grid[# i,1] = 30000; grid[# i,2] = -1
		i++
		grid[# i,0] = "Mason"; grid[# i,1] = 15000; grid[# i,2] = -1
		i++
		grid[# i,0] = "Bob"; grid[# i,1] = 10000; grid[# i,2] = -1
>>>>>>> 1.9
		i++
	}
	else if global.timer == 300
	{
		var i = 0;
<<<<<<< HEAD
		grid[# i,0] = "Dinosaur"; grid[# i,1] = 500000
		i++
		grid[# i,0] = "Jason"; grid[# i,1] = 380000
		i++
		grid[# i,0] = "Helen"; grid[# i,1] = 250000
		i++
		grid[# i,0] = "Peter"; grid[# i,1] = 200000
		i++
		grid[# i,0] = "Mike"; grid[# i,1] = 150000
		i++
		grid[# i,0] = "Lucas"; grid[# i,1] = 100000
		i++
		grid[# i,0] = "Tom"; grid[# i,1] = 80000
		i++
		grid[# i,0] = "Joanna"; grid[# i,1] = 60000
		i++
		grid[# i,0] = "Mason"; grid[# i,1] = 50000
		i++
		grid[# i,0] = "Bob"; grid[# i,1] = 40000
	}

	ini_open("stats_blitz"+string(global.timer)+".ini")
		ini_write_string("Title","value","BLITZ (" + convert_seconds_to_time(global.timer) +")") //This is what will be shown on top of the stats
		var str = ds_grid_write(grid)
		ini_write_string("Data","grid",str)
=======
		grid[# i,0] = "Dinosaur"; grid[# i,1] = 500000; grid[# i,2] = -1
		i++
		grid[# i,0] = "Jason"; grid[# i,1] = 380000; grid[# i,2] = -1
		i++
		grid[# i,0] = "Helen"; grid[# i,1] = 250000; grid[# i,2] = -1
		i++
		grid[# i,0] = "Peter"; grid[# i,1] = 200000; grid[# i,2] = -1
		i++
		grid[# i,0] = "Mike"; grid[# i,1] = 150000; grid[# i,2] = -1
		i++
		grid[# i,0] = "Lucas"; grid[# i,1] = 100000; grid[# i,2] = -1
		i++
		grid[# i,0] = "Tom"; grid[# i,1] = 80000; grid[# i,2] = -1
		i++
		grid[# i,0] = "Joanna"; grid[# i,1] = 60000; grid[# i,2] = -1
		i++
		grid[# i,0] = "Mason"; grid[# i,1] = 50000; grid[# i,2] = -1
		i++
		grid[# i,0] = "Bob"; grid[# i,1] = 40000; grid[# i,2] = -1
	}

	ini_open("Stats/stats_blitz"+string(global.timer)+".ini")
		ini_write_string("Title","value","BLITZ (" + convert_seconds_to_time(global.timer) +")") //This is what will be shown on top of the stats
		var str = ds_grid_write(grid)
		ini_write_string("Data","grid",str)
		ini_write_real("Info","has_level", false)
>>>>>>> 1.9
	ini_close()

	ds_grid_destroy(grid)


}

var grid = ds_grid_create(10,3)

	var i = 0;
	grid[# i,0] = "Dinosaur"; grid[# i,1] = 15000; grid[# i,2] = 2
	i++
	grid[# i,0] = "Jason"; grid[# i,1] = 12000; grid[# i,2] = 2
	i++
	grid[# i,0] = "Helen"; grid[# i,1] = 10000; grid[# i,2] = 2
	i++
	grid[# i,0] = "Peter"; grid[# i,1] = 8000; grid[# i,2] = 1
	i++
	grid[# i,0] = "Mike"; grid[# i,1] = 7000; grid[# i,2] = 1
	i++
	grid[# i,0] = "Lucas"; grid[# i,1] = 5000; grid[# i,2] = 1
	i++
	grid[# i,0] = "Tom"; grid[# i,1] = 4000; grid[# i,2] = 1
	i++
	grid[# i,0] = "Joanna"; grid[# i,1] = 2000; grid[# i,2] = 1
	i++
	grid[# i,0] = "Mason"; grid[# i,1] = 1000; grid[# i,2] = 1
	i++
	grid[# i,0] = "Bob"; grid[# i,1] = 500; grid[# i,2] = 1
	i++



ini_open("stats_buyo.ini")
	ini_write_string("Title","value","BUYO BUYO") //This is what will be shown on top of the stats
	var str = ds_grid_write(grid)
	ini_write_string("Data","grid",str)
ini_close()

ds_grid_destroy(grid)
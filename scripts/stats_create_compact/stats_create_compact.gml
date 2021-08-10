var grid = ds_grid_create(10,3)

	var i = 0;
	grid[# i,0] = "Dinosaur"; grid[# i,1] = 50000; grid[# i,2] = 10
	i++
	grid[# i,0] = "Jason"; grid[# i,1] = 45000; grid[# i,2] = 9
	i++
	grid[# i,0] = "Helen"; grid[# i,1] = 30000; grid[# i,2] = 8
	i++
	grid[# i,0] = "Peter"; grid[# i,1] = 25000; grid[# i,2] = 7
	i++
	grid[# i,0] = "Mike"; grid[# i,1] = 18000; grid[# i,2] = 6
	i++
	grid[# i,0] = "Lucas"; grid[# i,1] = 13000; grid[# i,2] = 5
	i++
	grid[# i,0] = "Tom"; grid[# i,1] = 9000; grid[# i,2] = 4
	i++
	grid[# i,0] = "Joanna"; grid[# i,1] = 5000; grid[# i,2] = 3
	i++
	grid[# i,0] = "Mason"; grid[# i,1] = 3000; grid[# i,2] = 2
	i++
	grid[# i,0] = "Bob"; grid[# i,1] = 1000; grid[# i,2] = 1
	i++



ini_open("stats_compact.ini")
	ini_write_string("Title","value","COMPACT") //This is what will be shown on top of the stats
	var str = ds_grid_write(grid)
	ini_write_string("Data","grid",str)
ini_close()

ds_grid_destroy(grid)
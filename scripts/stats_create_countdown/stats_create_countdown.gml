var grid = ds_grid_create(10,2)

var i = 0;
grid[# i,0] = "Dinosaur"; grid[# i,1] = 500000
i++
grid[# i,0] = "Jason"; grid[# i,1] = 350000
i++
grid[# i,0] = "Helen"; grid[# i,1] = 300000
i++
grid[# i,0] = "Peter"; grid[# i,1] = 150000
i++
grid[# i,0] = "Mike"; grid[# i,1] = 100000
i++
grid[# i,0] = "Lucas"; grid[# i,1] = 80000
i++
grid[# i,0] = "Tom"; grid[# i,1] = 60000
i++
grid[# i,0] = "Joanna"; grid[# i,1] = 45000
i++
grid[# i,0] = "Mason"; grid[# i,1] = 25000
i++
grid[# i,0] = "Bob"; grid[# i,1] = 10000
i++


ini_open("stats_countdown.ini")
	ini_write_string("Title","value","COUNTDOWN") //This is what will be shown on top of the stats
	var str = ds_grid_write(grid)
	ini_write_string("Data","grid",str)
ini_close()

ds_grid_destroy(grid)
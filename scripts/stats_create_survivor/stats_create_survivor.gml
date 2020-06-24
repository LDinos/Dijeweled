var grid = ds_grid_create(10,2)

var i = 0;
grid[# i,0] = "Dinosaur"; grid[# i,1] = 250
i++
grid[# i,0] = "Jason"; grid[# i,1] = 200
i++
grid[# i,0] = "Helen"; grid[# i,1] = 180
i++
grid[# i,0] = "Peter"; grid[# i,1] = 150
i++
grid[# i,0] = "Mike"; grid[# i,1] = 110
i++
grid[# i,0] = "Lucas"; grid[# i,1] = 80
i++
grid[# i,0] = "Tom"; grid[# i,1] = 70
i++
grid[# i,0] = "Joanna"; grid[# i,1] = 50
i++
grid[# i,0] = "Mason"; grid[# i,1] = 30
i++
grid[# i,0] = "Bob"; grid[# i,1] = 15
i++


ini_open("stats_survivor.ini")
	ini_write_string("Title","value","SURVIVOR") //This is what will be shown on top of the stats
	var str = ds_grid_write(grid)
	ini_write_string("Data","grid",str)
ini_close()

ds_grid_destroy(grid)
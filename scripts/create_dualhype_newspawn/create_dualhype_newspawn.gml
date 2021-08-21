///@description when swapping 2 cubes together, a new board should spawn but with 2 cubes coming back!
function create_dualhype_newspawn(argument0) {
	with(argument0)
	{
		ds_map_clear(spawn_specific_array)
		spawn_specific = true
		for (var p = 0; p < 8; p++) //1) Set random skins
		{
			for (var k = 0; k < 8; k++)
			{
				var key = string(p) + string(k) 
				var rand = irandom(Gamerule_1.num_skin)
				ds_map_set(spawn_specific_array, key + "_skin", rand)
				ds_map_set(spawn_specific_array, key + "_amHype", false)
			}
		}
	
		var rand_i1 = irandom(7) //2) set random cube 1
		var rand_j1 = irandom(7)
		var key = string(rand_i1) + string(rand_j1) 
		ds_map_set(spawn_specific_array, key + "_amHype", true)
		ds_map_set(spawn_specific_array, key + "_skin", 7)
	
		do //3) set random cube 2
		{
			var rand_i2 = irandom(7)
			var rand_j2 = irandom(7)
		}
		until (rand_i2 != rand_i1) || (rand_j2 != rand_j1)
		var key = string(rand_i2) + string(rand_j2) 
		ds_map_set(spawn_specific_array, key + "_amHype", true)
		ds_map_set(spawn_specific_array, key + "_skin", 7)
	}


}

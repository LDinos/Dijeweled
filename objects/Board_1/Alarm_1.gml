/// @description Fade in
perc += 0.05
x = lerp(room_width + 32,xx,1 - power(perc-1,2))
if perc < 1 alarm[1] = 1
else 
{
	perc = 0
	with(spawner1)
	{
		if !ds_map_exists(Gamerule_1.Replay_map, "NEWLEVELSPAWN")
		{
			#region make gems for first time
//1) create gems
for(i=0;i<=global.board_rows-1;i++)
{
	for(j=0;j<=7;j++)
	{
		gem_array[i,j] = irandom_range(0,Gamerule_1.num_skin)
	}
}

//2) make the Gem_1s not match

do
{
	amready2 = false
	amready = true
	for(i=0;i<=global.board_rows-1;i++)
	{
		for(j=0;j<=7;j++)
		{
			if i >= 1 && i <= global.board_rows-2
			{
				if (gem_array[i-1,j] == gem_array[i,j]) && (gem_array[i,j] == gem_array[i+1,j])
					{
						amready = false
						do gem_array[i,j] = irandom_range(0,Gamerule_1.num_skin)
						until gem_array[i,j] != gem_array[i-1,j]
					}
			}
			
			if j >= 1 && j <= 6
			{
				if (gem_array[i,j-1] == gem_array[i,j]) && (gem_array[i,j] == gem_array[i,j+1])
					{
						amready = false
						do gem_array[i,j] = irandom_range(0,Gamerule_1.num_skin)
						until gem_array[i,j] != gem_array[i,j-1]
					}
			}
			
			
		}
	}
	
	//3 always have moves at start
	if amready && global.board_rows = 3
		{
			amready2 = true
			for(j=0;j<=7;j++)
			{
				
					if j <= 6 
					{
						if (gem_array[1,j] == gem_array[2,j+1]) && (gem_array[1,j] == gem_array[0,j+1])
						{
							amready2 = false
						}
					}
					if j >= 1
					{
						if (gem_array[1,j] == gem_array[2,j-1]) && (gem_array[1,j] == gem_array[0,j-1])
						{
							amready2 = false
						}
					}
					if j <= 4
					{
						if (gem_array[1,j] == gem_array[1,j+2]) && (gem_array[1,j] == gem_array[1,j+3])
						{
							amready2 = false
						}
					}
					if j >= 3
					{
						if (gem_array[1,j] == gem_array[1,j-2]) && (gem_array[1,j] == gem_array[1,j-3])
						{
							amready2 = false
						}
					}
				
			}
			if !amready2 //4) shuffle and retry loop if we fail to find matches
				{
					for(i=0;i<=global.board_rows-1;i++)
					{
						for(j=0;j<=7;j++)
						{
							gem_array[i,j] = irandom_range(0,Gamerule_1.num_skin)
						}
					}
				}
		}
		else amready2 = true
} until (amready = true) && (amready2 = true)

// and now spawn them in board1
var gemsspawned = ds_list_create()
for(i=0;i<=global.board_rows-1;i++)
{
	for(j=0;j<=7;j++)
	{	
		var key = "NLS_" + string(i) +"_" +string(j) 
		ds_map_add(Gamerule_1.Replay_map,key + "_power",0)
		my_x = Board_1.x + 64*j
		my_y = Board_1.y - 64*(i+1)
		my_skin = gem_array[i,j]
		var gem = instance_create_depth(my_x, my_y,-1,Gem_1) 
		with(gem) set_skin(other.my_skin)
		ds_list_add(gemsspawned,gem)
	}
}

//now transfer powers
ds_list_shuffle(gemsspawned)

var index = 0
do
{
	if Gamerule_1.NXT_flames > 0
	{
		with(gemsspawned[| index])
		{
			gempower = 1
		}
		Gamerule_1.NXT_flames--
		index++
	}
	
	if Gamerule_1.NXT_lights > 0
	{
		with(gemsspawned[| index])
		{
		gempower = 2
		}
		Gamerule_1.NXT_lights--
		index++
	}
	
	if Gamerule_1.NXT_novas > 0
	{
		with(gemsspawned[| index]) 
		{
		gempower = 3
		}
		Gamerule_1.NXT_novas--
		index++
	}
	
	if Gamerule_1.NXT_septas> 0
	{
		with(gemsspawned[| index]) 
		{
		gempower = 4
		}
		Gamerule_1.NXT_septas--
		index++
	}
	
	if Gamerule_1.NXT_octas > 0
	{
		with(gemsspawned[| index]) 
		{
		gempower = 5
		}
		Gamerule_1.NXT_octas--
		index++
	}
	
	if Gamerule_1.NXT_fruits > 0
	{
		with(gemsspawned[| index]) 
		{
		gempower = 6

		}
		Gamerule_1.NXT_fruits--
		index++
	}
	
	if Gamerule_1.NXT_hypes > 0
	{
		with(gemsspawned[| index]) 
		{
			set_skin(7)
			amHype = true
			gempower = 0
		}
		Gamerule_1.NXT_hypes--
		index++
	}
	
}
until (Gamerule_1.NXT_flames = 0) && (Gamerule_1.NXT_hypes = 0) && (Gamerule_1.NXT_fruits = 0) && (Gamerule_1.NXT_lights = 0) && (Gamerule_1.NXT_novas = 0) && (Gamerule_1.NXT_septas = 0) && (Gamerule_1.NXT_octas = 0)

//Tell replay about that
if Gamerule_1.replay_allowed
{
	ds_map_add(Gamerule_1.Replay_map,"NEWLEVELSPAWN",true)
	for(i=0;i<8;i++)
	{
		for(j=0;j<8;j++)
		{
			my_x = Board_1.x + 64*j
			my_y = Board_1.y - 64*(i+1)
			var gem = collision_point(my_x, my_y,Gem_1,false,true)
			var key = "NLS_" + string(i) +"_" +string(j) 
			ds_map_add(Gamerule_1.Replay_map,key + "_skin", gem_array[i,j])
			ds_map_set(Gamerule_1.Replay_map,key + "_power", gem.gempower)
			ds_map_set(Gamerule_1.Replay_map,key + "_hype", gem.amHype)
		}
	}
}
ds_list_destroy(gemsspawned)
#endregion
		}
		else
		{
			#region make gems from replay
				for(i=0;i<=7;i++)
				{
					for(j=0;j<=7;j++)
					{	
						my_x = Board_1.x + 64*j
						my_y = Board_1.y - 64*(i+1)
						//my_skin = gem_array[i,j]
						var gem = instance_create_depth(my_x, my_y,-1,Gem_1) 
						with(gem)
						{
							key = "NLS_" + string(other.i) +"_" +string(other.j) 
							set_skin(Gamerule_1.Replay_map[? key + "_skin"])
							gempower = Gamerule_1.Replay_map[? key + "_power"]
							amHype = Gamerule_1.Replay_map[? key + "_hype"]
							if amHype set_skin(7)
						}
					}
				}
			#endregion
		}
		
	}
	Gamerule_1.spawnallowed = true
	Gamerule_1.levelcompleted = false
	Gamerule_1.IsGemActive = false
	Gamerule_1.IsGemActive2 = false
}
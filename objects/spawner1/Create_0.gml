/// @description spawner for first board
// You can write your code in this editor
spawn_specific = false //if we do a hyper dual match, we need to spawn new hypercubes. thats when its true
spawn_specific_array = ds_map_create()
for(var t = 0; t<8; t++) specific[t] = 0 //index
specific_count = 0 //on 64, spawn_specific turns false
match_replay = false
coalspawn = false
powerupspawn = false
bombspawn = -1 //this is the counter to use on our fresh spawned gem. if its -1 it means it wont spawn a bomb
havedone = false
showme = "-"
num_choices = ds_list_create()
if Gamerule_1.spawnallowed && !file_exists("autosave_"+string(room_get_name(room)))
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


if global.replay_match_allowed
{
	match_replay = true
}

// and now spawn them in board1
if (!global.spectator) { //When spectating, we will spawn gems on both boards on user_event1
	for(i=0;i<=global.board_rows-1;i++)
	{
		if match_replay match_up_index[i] = 1
		for(j=0;j<=7;j++)
		{
			#region Match replay only
			if match_replay
			{
				var key = string(i)+"-"+string(j)
				ds_map_add(Gamerule_1.Replay_match_map,key + "_spawn",gem_array[i,j])
			}
			#endregion
			my_x = Board_1.x + 64*j
			my_y = Board_1.y - 64*(i+1)
			my_skin = gem_array[i,j]
			Gem = instance_create_depth(my_x, my_y,-1,Gem_1)
			with(Gem) 
			{
				set_skin(other.gem_array[other.i,other.j])
				if global.online
				{
					scr_add_gemid(Gamerule_1)
				}
			}
		}
	}
}
#endregion
}

function initial_spawn(gem_id, board_id, gamerule_id, p_id = 0) {
	var x1,y1,G,mskin
	for(i=0;i<=global.board_rows-1;i++)
	{
		for(j=0;j<=7;j++)
		{
			x1 = board_id.x + 64*j
			y1 = board_id.y - 64*(i+1)
			mskin = gem_array[i,j]
			G = instance_create_depth(x1, y1,-1,gem_id,  {player_id : p_id, MyBoard : board_id, MyGamerule : gamerule_id}) 
			G.player_id = p_id
			G.MyBoard = board_id
			G.MyGamerule = gamerule_id
			with(G) 
			{
				set_skin(other.gem_array[other.i,other.j])
				if global.online scr_add_gemid(gamerule_id)
			}
		}
	}
}
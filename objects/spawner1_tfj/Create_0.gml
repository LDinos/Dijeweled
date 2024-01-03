/*
coalspawn = false CERI - COMMENTING YOU OUT
powerupspawn = false
bombspawn = -1 //this is the counter to use on our fresh spawned gem. if its -1 it means it wont spawn a bomb
CERI - COMMENTING YOU OUT
*/
function generateSkinArray()
{
	for(i=0;i<=global.board_rows-1;i++)
	{
		for(j=0;j<=7;j++)
		{
			gem_array[i,j] = irandom_range(0,Gamerule_1.num_skin)
		}
	}
	do
	{
		var amready = true
		for(i=0;i<8;i++)									
		{
			for(j=0;j<8;j++)
			{
				if i > 0 && i < 7 //middle rows
				{
					if (gem_array[i-1,j] == gem_array[i,j]) && (gem_array[i,j] == gem_array[i+1,j])//vertical match
					{
						amready = false
						do gem_array[i,j] = irandom_range(0,Gamerule_1.num_skin)
						until gem_array[i,j] != gem_array[i-1,j]
					}
				}

				if j > 0 && j < 7 //middle commumns
				{
					if (gem_array[i,j-1] == gem_array[i,j]) && (gem_array[i,j] == gem_array[i,j+1]) //horizontal match
					{
						amready = false
						do gem_array[i,j] = irandom_range(0,Gamerule_1.num_skin)
						until gem_array[i,j] != gem_array[i,j-1]
					}
				}
			}
		}
	} until (amready = true)
}

function spawnGems()
{
	instance_destroy(Gem_1)
	for(i=0;i<8;i++)
	{
		for(j=0;j<8;j++)
		{
			var my_x = Board_1.x + 64*j
			var my_y = Board_1.y + 64*i
			var Gem = instance_create_depth(my_x, my_y,-1,Gem_1)
			Gamerule_1.gems_fallen[i,j] = Gem
			with(Gem) {set_skin(other.gem_array[other.i,other.j])}
		}
	}
}

spawn_specific = false //if we do a hyper dual match, we need to spawn new hypercubes. thats when its true
spawn_specific_array = ds_map_create()
for(var t = 0; t<8; t++) specific[t] = 0 //index
specific_count = 0 //on 64, spawn_specific turns false
havedone = false
num_choices = ds_list_create()

if !Gamerule_1.spawnallowed exit
gem_array = []
generateSkinArray() //modifies gem_array
spawnGems()

function initial_spawn(gem_id, board_id, gamerule_id, p_id = 0)
{
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


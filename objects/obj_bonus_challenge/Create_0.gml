/// @description Insert description here
num_of_challenges = 1 //used for full match replay to indicate number of challenge patterns, 0 being the first
sperm = 0
sperm_travelling = 0
moving = false
list_of_matches = ds_list_create() //list of matches to be checked
depth = 0
instance_create(x,y,obj_bonus_doors) //spawn the door

if global.replay_match_isplaying
{
	
	Replay_load = ds_map_create()
	var json = json_read_parse(global.replay_string)
	//ini_open(global.replay_string)
		var sect = json.data//ini_read_string("replay","data","-")
		ds_map_read(Replay_load,sect)
	//ini_close()
	
	num_of_challenges_cur = 1
	num_of_challenges =  Replay_load[? "num_of_challenges"]
	for(var i=0;i<=num_of_challenges;i++)
	{
		
		for(var j=0;j<4;j++)
		{
			bonus_lit[j] = false //did we currently do the individual gem bonus?
			future_bonuses[i,j] = Replay_load[? "challenge_pattern" + string(i)+string(j)]
		}
	}
	for(var i=0;i<4;i++) bonus[i] = future_bonuses[0,i]
	ds_map_destroy(Replay_load)
}
else
{
	for(var i=0;i<4;i++) //generate bonus
	{
		bonus_lit[i] = false //did we currently do the individual gem bonus?
		bonus[i] = irandom_range(0,Gamerule_1.num_skin)
		if i > 0
		{
			if bonus[i] == bonus[i-1]
			{
				do
				{
					bonus[i] = irandom_range(0,Gamerule_1.num_skin)
				}
				until bonus[i] != bonus[i-1]
			}
		}
	
		future_bonus[i] = irandom_range(0,Gamerule_1.num_skin)
		if i > 0
		{
			if future_bonus[i] == future_bonus[i-1]
			{
				do
				{
					future_bonus[i] = irandom_range(0,Gamerule_1.num_skin)
				}
				until future_bonus[i] != future_bonus[i-1]
			}
		}
	
		challenge_pattern[0,i] = bonus[i]
		challenge_pattern[1,i] = future_bonus[i]
		if global.replay_match_allowed
		{
			ds_map_add(Gamerule_1.Replay_match_map,"num_of_challenges",num_of_challenges)
			ds_map_add(Gamerule_1.Replay_match_map,"challenge_pattern0" + string(i),bonus[i])
			//ds_map_add(Gamerule_1.Replay_match_map,"challenge_pattern1" + string(i),future_bonus[i])
		}
	}
}
challenge_complete = false
bonus_index = 0 //indicator place. If its on 3, its challenge complete
indicator_x = x //indicator x value
perc = 0 //Lerp percentage (0 - 1)
xx = x //Lerp default x
perc2 = 0
xx2 = x
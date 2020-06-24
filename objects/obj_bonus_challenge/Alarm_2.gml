/// @description do alarm[1]
//sperm_travelling = 0
if global.replay_match_isplaying
{
	
	for(var i=0;i<4;i++) {bonus[i] = future_bonuses[num_of_challenges_cur,i]; bonus_lit[i] = false}
	num_of_challenges_cur++
}
else
{
	for(var i=0;i<4;i++) bonus[i] = future_bonus[i] //make new bonus
	
	for(var i=0;i<4;i++) //generate bonus
	{
		bonus_lit[i] = false //did we currently do the individual gem bonus?
	
		future_bonus[i] = irandom_range(0,Gamerule_1.num_skin) //generate new future bonus
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
		/*MATCH REPLAY*/
		challenge_pattern[num_of_challenges,i] = future_bonus[i]
		if global.replay_match_allowed
		{
			ds_map_set(Gamerule_1.Replay_match_map,"num_of_challenges",num_of_challenges)
			ds_map_add(Gamerule_1.Replay_match_map,"challenge_pattern" + string(num_of_challenges) + string(i),bonus[i])
		}
		/*---------------*/
	} num_of_challenges++
}
challenge_complete = false
indicator_x = x
alarm[1] = 1
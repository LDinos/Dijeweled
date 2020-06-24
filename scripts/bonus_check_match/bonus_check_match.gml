//Did we match or not? If so, how much does the indicator move to the right?
if !challenge_complete
{
	var flag, didcolormatch;
	didcolormatch = false //if we matched, but NOT in the desired color, we need to change the bonus index, but we need to check how far back it goes
	do
	{
		flag = false
		for(var i = 0; i < ds_list_size(list_of_matches); i++)
		{
			if list_of_matches[| i] == bonus[bonus_index]
			{
					bonus_set_index(bonus_index+1)
					ds_list_delete(list_of_matches,i)
					flag = true
					didcolormatch = true
			}
			if flag break;//no need to keep up the inside for loop
		}
	
	}
	until flag = false

	if (bonus_index != 0) && (!didcolormatch) && (Gamerule_1.combo = 1)//if we didn't color match, (and we are talking about a non-cascade) lets check how far back we need to set our bonus index
	{
		bonus_check_match_rewind()
	}
}
/// @description Lighten up gems that are already completed
for(var i = 0; i < 4; i++)
{
	if !challenge_complete
	{
		if bonus_index > i
		{
			bonus_lit[i] = true
		}
		else bonus_lit[i] = false
	}
	else bonus_lit[i] = true
}

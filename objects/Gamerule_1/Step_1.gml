/// @description put gems on array and store them
if (!levelcompleted)
{
	if !IsGemActive
	{
		for(var i=7;i>=0;i--) //make board array empty
			{
				for(var j=7;j>=0;j--)
				{
					gem_board1[@i,j] = noone
					gemboard[@i,j] = -1
				}
			}
	}
	
	with(Gem_1) //fill it up with gems
	{
		if _i >= 0
		{
			other.gem_board1[@_i,_j] = id
			other.gemboard[@_i,_j] = skinnum
			
			if acc != 0 other.ready = false
		}
		else other.ready = false
	}
}

if ready
{
	#region ready = false
		if (moving) ready = false
		else if (flameon) ready = false
		else if (lightOn) ready = false
		else if (hypeOn) ready = false
		else if (fruit_spawning) ready = false
		else if (fruit_exploding) ready = false
	#endregion
}

if ready
{
	if alarm[0] = -1 alarm[0] = 1 //isgemactive1
}
else
{
	autosave = false
	doonce = 0
	IsGemActive = false
	IsGemActive2 = false
	alarm[0] = -1
	alarm[1] = -1
}
ready = true;
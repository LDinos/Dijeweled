/// @description Match animation - after
// You can write your code in this editor
	make_gems_fallen(Gamerule_1)
	flag = false
	gemtoexplode1 = noone
	gemtoexplode2 = noone
	with(Gamerule_1)
	{
		check_for_xplier = true //check for multiplier increase/decrease on this move (gets to false after matcher_stepevent)
		increase_xplier = false //as default, lets say we did an illegal move (decrease xplier)
	}
	with(gemtomove1) {check_ifmatch(Gamerule_1)}
	with(gemtomove2) {check_ifmatch(Gamerule_1)}
	
	if flag
	{
		if Gamerule_1.blazingallowed {
			Gamerule_1.blazingchainup = true;
		}
		if !Gamerule_1.blazingspeed
		{
			Gamerule_1.blazingshouldup = true;
		}
		else
			{
				with(gemtoexplode1) amexplode = true
				with(gemtoexplode2) amexplode = true
			}
		alarm[7] = 3
		Gamerule_1.moving = false
		
		with(gemtomove1) 
		{		
			alarm[2] = 2
		}
		with(gemtomove2) 
		{ 
			alarm[2] = 2
		}
	}
	else //if no matches happen
	{
		if (replay_version > 0) { //This was not possible before 1.14, so check out replay version
			if Gamerule_1.illegals_allowed {
				Gamerule_1.blazingspeedchain = 0
				Gamerule_1.blazingspeedtotalchain = 0
			}
		}
		with(Gamerule_1.list_of_doom)
		{
			audio_play_sound(snd_doom_count,0,0)
			countdown_decrease()
		}
		with(obj_bonus_challenge) bonus_set_index(0)
		if instance_exists(gemtomove1) && instance_exists(gemtomove2)
		{
			temp = gemtomove1
			gemtomove1 = gemtomove2
			gemtomove2 = temp
			if !Gamerule_1.illegals_allowed do_match_turnback(Gamerule_1)
			else
			{
				with(Gem_1) matchnear = false;
				with(gemtomove1) 
				{
					unspin(); 
					alarm[2] = 2
					if other.gem1 = id other.gem1 = noone
					else if other.gem2 = id other.gem2 = noone
				} 
				with(gemtomove2) 
				{
					unspin(); 
					alarm[2] = 2
					if other.gem1 = id other.gem1 = noone
					else if other.gem2 = id other.gem2 = noone
				}
				alarm[7] = 3
				Gamerule_1.moving = false
			}
		}
		else {alarm[7] = 3; Gamerule_1.moving = false}
		
	}


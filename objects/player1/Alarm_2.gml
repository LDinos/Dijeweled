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
		with(obj_countdown_controller) moves--
		if Gamerule_1.isQuest
		{			
			with(obj_quest_control)
			{
				if (C_movesneeded != S_movesdone) S_movesdone++
				if L_movesleft > 0 L_movesleft--
			}
		}
		Gamerule_1.chain++
		Gamerule_1.blazingchainup = true;
		if !Gamerule_1.blazingspeed
		{
			Gamerule_1.blazingshouldup = true;
			//with(Gamerule_1) blazing_check()
			//Gamerule_1.blazingspeedchain++
			//Gamerule_1.blazingcounter = 140
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
		if Gamerule_1.illegals_allowed with(obj_countdown_controller) moves--
		if Gamerule_1.isQuest
		{
			if Gamerule_1.illegals_allowed
			{
				
				with(obj_quest_control)
				{
					if (C_movesneeded != S_movesdone) S_movesdone++
					if L_movesleft > 0 L_movesleft--
				}
			}
			else
			{
				with(obj_quest_control)
				{
					if C_gemsare0 != -1
					{
						checkpoint-- //get back one autosave so undo wont deal with illegal moves
					}
				}
			}
		}
		Gamerule_1.chain = 0
		if !Gamerule_1.zenify audio_play_sound(snd_xplier_illegal,0,0)
		Gamerule_1.illegal_cando = false
		with(Gamerule_1.list_of_doom)
		{
			if !Gamerule_1.zenify audio_play_sound(snd_doom_count,0,0)
			countdown_decrease()
		}
		with(obj_bonus_challenge) bonus_set_index(0)
		//Gamerule_1.blazingspeedchain = 0
		//Gamerule_1.blazingcounter = 140
		if instance_exists(gemtomove1) && instance_exists(gemtomove2)
		{
			temp = gemtomove1
			gemtomove1 = gemtomove2
			gemtomove2 = temp
			if !Gamerule_1.illegals_allowed && !Gamerule_1.replay_illegals_allowed do_match_turnback(Gamerule_1)
			else
			{				
				with(Gem_1) matchnear = false;
				with(gemtomove1) 
				{	
					alarm[2] = 2
				} 
				with(gemtomove2) 
				{
					alarm[2] = 2
				}
				alarm[7] = 3
				Gamerule_1.moving = false
			}
		}
		else {alarm[7] = 3; Gamerule_1.moving = false}
		
	}
Gamerule_1.replay_illegals_allowed = false	

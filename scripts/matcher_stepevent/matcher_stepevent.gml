function matcher_stepevent(argument0) {

	/* Function in which every row is checked if gems are matched. It goes like this; 
	//we search every gem from the second position and compare its skin with the first one. If its the same, make n += 1. 
	//Now, we check the third. If the third one isnt the same as the second one, n resets to 1.
	//If we had reached n > 3 and the j'th gem isnt the same as the j'th gem, then we see what n grade was our match.
	Should it be a 3 match, call a 3 match on the centered gem. Should it be 4th, call 4th etc... */
	//0 match
	//1 flame
	//2 lightning
	//3 star
	//4 nova
	//5 septa
	//6 octa
	//Then check for horizontal matches
	var cando = true

	ds_list_clear(list_of_matches) //clear the challenge bonus list
	//REPLAY\\
	if replay_allowed && !juststarted
	{
		replay_savepoint()
	}
	/*-------------*/
	if cando
	{
	center_gem = noone
	nummatches = 0 //for doubleset soundeffect
	with(argument0) matchme = -1
	//Start with horizontals
	for (i=0;i<=global.board_rows-1;i+=1)
	    {
	        n = 1
	        for (j=1;j<=7;j+=1)
	        {
        
	          if gem_board1[i][j] = noone || gem_board1[i][j-1] = noone
	            {
					matcher_script1(0)
	            }
	          else if (gem_board1[i][j].skinnum == gem_board1[i][j-1].skinnum) && (gem_board1[i][j].skinnum != 7) //else add up
	            {
	                n++
	            }
	          else { //if the gem skins are not the same, check for matches
				
					if n >=3
					{
						nummatches++
						list_of_matches[| ds_list_size(list_of_matches)] = gem_board1[i][j-1].skinnum
					}
	                matcher_script1(0)
	            }
	          if j = 7 // on last check, check for matches again since we dont have a next check.
	            {
		            if n >=3 
					{
						nummatches++
						list_of_matches[| ds_list_size(list_of_matches)] = gem_board1[i][j].skinnum
					}
		            matcher_script1(1)
	            }
                          
	        }
	    }
	//Now check vertical ones, while having in mind diagonal too
	center_gem = noone
	for (i=0;i<=7;i+=1)
	    {
	        n2 = 1
	        for (j=1;j<=global.board_rows-1;j+=1)
	        {
	          if gem_board1[j][i] = noone || gem_board1[j-1][i] = noone
	            {
					matcher_script2(0)
	            }
	          else if (gem_board1[j][i].skinnum == gem_board1[j-1][i].skinnum) && (gem_board1[j][i].skinnum != 7)
	            {
	                n2++
	            }
	          else 
				{
					center_gem = noone
	                if n2 >=3 
					{
						nummatches++
						list_of_matches[| ds_list_size(list_of_matches)] = gem_board1[j-1][i].skinnum
					}
	                matcher_script2(0)        
	            }
	          if j = global.board_rows-1 // on last check, check again since we dont have a next check.
	            {
					if n2 >=3 
					{
						nummatches++
						list_of_matches[| ds_list_size(list_of_matches)] = gem_board1[j][i].skinnum
					}
					matcher_script2(1) 
	            }
                       
	        }
	    }
	//Now do their script
	havecombo = false
	for (i=0;i<=global.board_rows-1;i+=1)
	    {
	        for (j=0;j<=7;j+=1)
	        {
				
	        if gem_board1[i][j] != noone
	        {
				if gem_board1[i][j].matchme >= 0
				{
					if !ultranovas_allowed
					{
						if gem_board1[i][j].matchme > 4
						{
							gem_board1[i][j].matchme = 4
						}
					}
				
					//for when a full board colored board happens, kick the top gem a little upwards
					if (gem_board1[i][j].dragXX != 0) 
					{
						with(gem_board1[i][j]) {create_gem_disabler()}
					}
					havecombo = true
				
					if blazingchainup && blazingallowed 
					{
						blazingspeedtotalchain++;
					}
					
					if blazingshouldup && blazingallowed
					{
						blazing_check()				
						blazingspeedchain++
						blazingcounter = 140
					}
					blazingchainup = false;
					blazingshouldup = false	
					if gem_board1[i][j].gempower != 6
					{
						//show_message(gem_board1[i][j])
						if gem_board1[i][j].matchme == 6 //octa
						{
							if specials_allowed
							{
								audio_play_sound(snd_octacreate,0,false)
								audio_play_sound(snd_lightcreate,0,false)
								with(gem_board1[i][j]) make_power(argument0,5,other.id)
							}
			                else instance_destroy(gem_board1[i][j])
						}
						else if gem_board1[i][j].matchme == 5 //septa
						{
							if specials_allowed
							{
								audio_play_sound(snd_septacreate,0,false)
								audio_play_sound(snd_lightcreate,0,false)
								with(gem_board1[i][j]) make_power(argument0,4,other.id)
							}
							else instance_destroy(gem_board1[i][j])
						}
						else if gem_board1[i][j].matchme == 4 //nova
			            {
			                if specials_allowed
							{
								audio_play_sound(snd_supernovacreate,0,false)
								audio_play_sound(snd_lightcreate,0,false)
								with(gem_board1[i][j]) make_power(argument0,3,other.id)
							}
							else instance_destroy(gem_board1[i][j])
			            }
			            else if gem_board1[i][j].matchme == 3  //lighting (5 match)
			            {
							if !hypeallowed
			                {
				                if specials_allowed
								{
									
									audio_play_sound(snd_lightcreate,0,false)
									with(gem_board1[i][j]) make_power(argument0,2,other.id)
								}
				                else instance_destroy(gem_board1[i][j])
							}
							else
				            {
				                if specials_allowed
								{
									audio_play_sound(snd_hypecreate,0,false)
									with(gem_board1[i][j]) make_hype(argument0,other.id)
								}
				                else instance_destroy(gem_board1[i][j])              
				            }
                
			            }
			            else if gem_board1[i][j].matchme == 2  //star gem (5 match L-T)
			            {
			                if specials_allowed
							{
								audio_play_sound(snd_starcreate,0,false)
								with(gem_board1[i][j]) make_power(argument0,2,other.id)
							}
							else instance_destroy(gem_board1[i][j])
			            }
			            else if gem_board1[i][j].matchme == 1 //flame
			            {
			                if specials_allowed
							{
								audio_play_sound(snd_flamecreate,0,false)
								with(gem_board1[i][j]) make_power(argument0,1,other.id)
							}
			                else instance_destroy(gem_board1[i][j])                
			            }
			            else if gem_board1[i][j].matchme == 0 //nada
			            { 
							if !gem_board1[i][j].amPowered
							{
								if combo > 0 gem_board1[i][j].cascade_diss = true
								instance_destroy(gem_board1[i][j])
							}	
						}
					}
					else if !gem_board1[i][j].amFruitExploding
					{
						gem_board1[i][j].amFruitExploding = true
						ds_list_add(list_of_fruits, gem_board1[i][j])
					}
			
				}
            
	        }

	        }
	    }
		//show_message("are we good 1")
	
	if !ds_list_empty(list_of_fruits)
	{
		if !fruit_exploding
		{
			with(list_of_fruits[| 0])
			{
				fruit_explode()
			}
			ds_list_delete(list_of_fruits,0)
		}
	}

	if nummatches > 1 audio_play_sound(snd_doubleset,0,0)

	if havecombo
	{
		matches++
		combo_check()
		if global.online
		{
			network_send(NN_MATCH_GEM_COMBO_SOUND, [buffer_u8], [combo])
		}
		combo++
		if (combo > bestcombo) bestcombo = combo
	}


	if nummatches > 0 //if matches happened
	{
		if combo >= 3 && !global.online && Gamerule_1.points_text_allowed { instance_destroy(cascade_text); instance_create(Board_1.x - 32*7, Board_1.y + (Board_1.sprite_height/2) + 128 - 96, cascade_text)}
		with(obj_bonus_challenge)
		{
			list_of_matches = other.list_of_matches
			bonus_check_match()
		}
	}

	if check_for_xplier
	{
		if increase_xplier
		{
			with(obj_xplier) event_user(0)
		}
		else with(obj_xplier) event_user(2)
		check_for_xplier = false //dont check again until another user move has been made
	}
	}

}

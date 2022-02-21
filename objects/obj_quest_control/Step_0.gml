/// @description Insert description here
// You can write your code in this editor
if !amdone
{
var num_of_objectives = 0
var num_of_completed_objectives = 0
if L_movesleft != -1
{
	if L_movesleft <= 5 {with(obj_questmusic) {if !isdanger event_user(2)}}
}
#region MAIN BODY
	if C_gemsare0
	{
		num_of_objectives++
		if !Gamerule_1.spawnallowed
		{
			if Gamerule_1.IsGemActive 
			{
				if !gems0doonce
				{
					gems0doonce = true
				initiate_hiddengems()
				var numofgems = 0
				with(Gem_1) if !amInvisible numofgems++
				if numofgems = 0 num_of_completed_objectives++
				}
			}
			else gems0doonce = false
		}
	}
	
	if C_pattern_enabled
	{
		num_of_objectives++
		if Gamerule_1.IsGemActive 
		{
			var n1 = 0, n2 = 0;
			for(var i = 0; i < 8 ; i++)
			{
				for(var j = 0; j < 8 ; j++)
				{
					C_pattern_isOn[i][j] = false
					if C_pattern[i][j] != -1
					{
						n1++
						
						if (Gamerule_1.gems_skin_array[i][j] == C_pattern[i][j]) {C_pattern_isOn[i][j] = true; n2++}
					}
				}
			}
			if (n1 == n2) num_of_completed_objectives++
		}
	}
	
	if C_movesneeded != -1
	{
		num_of_objectives++
		if S_movesdone >= C_movesneeded num_of_completed_objectives++
	}
	
	if C_summoves != -1
	{
		num_of_objectives++
		if Gamerule_1.summoves2 >= C_summoves num_of_completed_objectives++
	}
	
	if C_cascades != -1
	{
		num_of_objectives++
		if Gamerule_1.combo >= C_cascades num_of_completed_objectives++
	}
	
	#region C_destroy
	if C_match_gems != -1
	{
		num_of_objectives++
		if S_matched_gems >= C_match_gems num_of_completed_objectives++
	}
	
	if C_destroy_gems != -1
	{
		num_of_objectives++
		if S_destroyed_gems >= C_destroy_gems num_of_completed_objectives++
	}
	
	if C_destroy_fruits != -1
	{
		num_of_objectives++
		if S_destroyed_fruits >= C_destroy_fruits num_of_completed_objectives++
	}
	
	if C_destroy_coals != -1
	{
		num_of_objectives++
		if S_destroyed_coals >= C_destroy_coals num_of_completed_objectives++
	}
	
	if C_destroy_ice != -1
	{
		num_of_objectives++
		if S_destroyed_ice >= C_destroy_ice num_of_completed_objectives++
	}
	
	if C_destroy_locks != -1
	{
		num_of_objectives++
		if S_destroyed_locks >= C_destroy_locks num_of_completed_objectives++
	}
	
	if C_destroy_bombs != -1
	{
		num_of_objectives++
		if S_destroyed_bombs >= C_destroy_bombs num_of_completed_objectives++
	}
	
	if C_destroy_dooms != -1
	{
		num_of_objectives++
		if S_destroyed_dooms >= C_destroy_dooms num_of_completed_objectives++
	}
	
	if C_destroy_skulls != -1
	{
		num_of_objectives++
		if S_destroyed_skulls >= C_destroy_skulls num_of_completed_objectives++
	}
	
	if C_destroy_flame != -1
	{
		num_of_objectives++
		if S_destroyed_flames >= C_destroy_flame num_of_completed_objectives++
	}
	
	if C_destroy_lightning != -1
	{
		num_of_objectives++
		if S_destroyed_lights >= C_destroy_lightning num_of_completed_objectives++
	}
	
	if C_destroy_hype != -1
	{
		num_of_objectives++
		if S_destroyed_hypes >= C_destroy_hype num_of_completed_objectives++
	}
	
	if C_destroy_nova != -1
	{
		num_of_objectives++
		if S_destroyed_novas >= C_destroy_nova num_of_completed_objectives++
	}
	
	if C_destroy_septa != -1
	{
		num_of_objectives++
		if S_destroyed_septas >= C_destroy_septa num_of_completed_objectives++
	}
	
	if C_destroy_octa != -1
	{
		num_of_objectives++
		if S_destroyed_octas >= C_destroy_octa num_of_completed_objectives++
	}
	#endregion
	
	#region C_num's
	if C_num_chain != -1
	{
		num_of_objectives++
		if Gamerule_1.chain >= C_num_chain num_of_completed_objectives++
	} 
	
	if C_num_green != -1
	{
		num_of_objectives++
		if S_num_green >= C_num_green num_of_completed_objectives++
	}
	
	if C_num_red != -1
	{
		num_of_objectives++
		if S_num_red >= C_num_red num_of_completed_objectives++
	}
	
	if C_num_white != -1
	{
		num_of_objectives++
		if S_num_white >= C_num_white num_of_completed_objectives++
	}
	
	if C_num_yellow != -1
	{
		num_of_objectives++
		if S_num_yellow >= C_num_yellow num_of_completed_objectives++
	}
	
	if C_num_orange != -1
	{
		num_of_objectives++
		if S_num_orange >= C_num_orange num_of_completed_objectives++
	}
	
	if C_num_purple != -1
	{
		num_of_objectives++
		if S_num_purple >= C_num_purple num_of_completed_objectives++
	}
	
	if C_num_blue != -1
	{
		num_of_objectives++
		if S_num_blue >= C_num_blue num_of_completed_objectives++
	}
	
	if C_num_coals != -1
	{
		num_of_objectives++
		if S_num_coals >= C_num_coals num_of_completed_objectives++
	}
	
	if C_num_hype != -1
	{
		num_of_objectives++
		if S_num_hypes >= C_num_hype num_of_completed_objectives++
	}
	
	if C_num_fruits != -1
	{
		num_of_objectives++
		if S_num_fruits >= C_num_fruits num_of_completed_objectives++
	}
	
	if C_num_flame != -1
	{
		num_of_objectives++
		if S_num_flames >= C_num_flame num_of_completed_objectives++
	}
	
	if C_num_lightning != -1
	{
		num_of_objectives++
		if S_num_lights >= C_num_lightning num_of_completed_objectives++
	}
	
	if C_num_nova != -1
	{
		num_of_objectives++
		if S_num_novas >= C_num_nova num_of_completed_objectives++
	}
	
	if C_num_septa != -1
	{
		num_of_objectives++
		if S_num_septas >= C_num_septa num_of_completed_objectives++
	}
	
	if C_num_octa != -1
	{
		num_of_objectives++
		if S_num_octas >= C_num_octa num_of_completed_objectives++
	}
	
	if C_num_points != -1
	{
		num_of_objectives++
		if Gamerule_1.points >= C_num_points num_of_completed_objectives++
	}
	
	if C_num_zenifycombo != -1
	{
		num_of_objectives++
		if S_num_zenifycombo >= C_num_zenifycombo num_of_completed_objectives++
	}
	
	#endregion

#endregion

if L_noslightning != -1 && (!L_noslightning_endgame)
{
	if (L_noslightning == 1) {reset_challenge_stats()}
}

if (L_nospecialgems != -1) && (!L_nospecialgems_endgame)
{
	if (L_nospecialgems == 1) {reset_challenge_stats()}
}

#region VICTORY/LOSS CONDITIONS
if (num_of_completed_objectives == num_of_objectives) { /*if !Gamerule_1.bombis0*/ {Gamerule_1.challengewon = true ;victory = true}}
else //LOSS CONDITION
{
	if (L_badgem) loss = true
	if (L_nospecialgems = 1 && L_nospecialgems_endgame) loss = true
	if (L_noslightning = 1) && (L_noslightning_endgame) loss = true
	if L_movesleft != -1
	{
		if L_movesleft = 0 loss = true
	}
	if L_time != -1
	{
		if L_time = 0 loss = true
	}
	if L_drain != -1
	{
		if Gamerule_1.points = 0 loss = true
	}
}
#endregion

#region Ending

	if victory //if we won
	{
		if !amdone //doonce
		{
			
			Gamerule_1.controlallowed = false
			if Gamerule_1.IsGemActive2 //all should be stationary
			{
				if !custom_quest
				{
					ini_open("challenges.ini")
						if global.chl_to_unlock != "none"
						{
							if ini_read_real("Info",global.chl_to_unlock+"-Status",0) = 1 ini_write_real("Info",global.chl_to_unlock+"-Status",0)
						}
						ini_write_real("Info",global.chl_to_succeed+"-Status",2)
					ini_close()
				}
				else
				{
					var f = working_directory +"/CustomQuests/"+string(global.challenge_index)+".ini"
					ini_open(f)
						ini_write_real("General","status",2)
					ini_close()
				}	
			amdone = true
			audio_play_sound(vo_questcomplete,0,0)
			create_textellent("QUEST COMPLETE")
			with(obj_questmusic) {win = true; event_user(1)}
			alarm[0] = 120
			}
		}
	}
	else if loss //if we lost
	{
		if !amdone //doonce
		{
			Gamerule_1.controlallowed = false
			if Gamerule_1.IsGemActive2 //all should be stationary
			{
				amdone = true
				audio_play_sound(vo_gameover,0,0)
				//instance_create_depth(room_width/2,room_height - 720/2,-10,obj_gameover_text)
				create_textellent("GAME OVER")
				with(obj_questmusic) {win = false; event_user(1)}
				alarm[0] = 200
			}
		}	
	}

#endregion
}
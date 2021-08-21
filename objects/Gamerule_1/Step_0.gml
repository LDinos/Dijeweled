/// @description Level complete check + cur_time
should_move = true
if (lightOn || hypeOn || fruit_exploding_dontmove) should_move = false
if (global.replay_match_allowed || global.replay_match_isplaying) cur_time++ //this var is used on replay only

// Finish level \\
if (points >= levelpointsneeded) && !time_allowed //if points are more than levelpointsneeded and time is not allowed, we know the progress bar is full
{
	if (levelcompleteallowed) levelbarfull = true
	else leverballfull = false
}
else levelbarfull = false

if (levelbarfull)
{
	with(obj_bonus_challenge) other.challenge_active = challenge_complete
	
	if !instance_exists(Coal_break) && (IsGemActive2) && (ds_list_empty(list_of_fruits)) && (!fruit_want_to_spawn) && (!fruit_spawning) && (!challenge_active) levelcompleted = true
	else levelcompleted = false
	controlallowed = false //no more moves allowed from now on
	with(player1) //make player 1 deselect gems
	{
		with(gem1) unspin()
		with(gem2) unspin()
		gem1 = noone
		gem2 = noone
	}
	if (levelcompleted)
	{
		part_particles_clear(global.sys_above_gem)
		part_particles_clear(global.sys_below_gem)
		level_complete_get_powers()
		spawnallowed = false
		level++
		discord_update_presence(global.DIS_name,"Level " + string(Gamerule_1.level),"ico_512","")
		#region secret
		if (level == 20) //secret unlock
		{
			if (room == rm_timeattack)
			{
				if !file_exists("secrets.ini") file_create_secrets()
				var l = ds_list_create()
				ini_open("secrets.ini")
					var str = ini_read_string("secret","data","")
					ds_list_read(l,str)
					if l[| 0] == false
					{
						instance_create_depth(0,512,-99,obj_secretunlock)
						l[| 0] = true
						var str = ds_list_write(l)
						ini_write_string("secret","data",str)
					}
				ini_close()
			}
			else if (room == rm_zen)
			{
				if !file_exists("secrets.ini") file_create_secrets()
				var l = ds_list_create()
				ini_open("secrets.ini")
					var str = ini_read_string("secret","data","")
					ds_list_read(l,str)
					if l[| 1] == false
					{
						instance_create_depth(0,512,-99,obj_secretunlock)
						l[| 1] = true
						var str = ds_list_write(l)
						ini_write_string("secret","data",str)
					}
				ini_close()
			}
		}
		#endregion
		audio_play_sound(vo_levelcomplete,0,0)
		instance_create_depth(Board_1.x + 32 + Board_1.sprite_width/3 ,Board_1.y + 32 + Board_1.sprite_height/3,-15,obj_levelcompletetext)
		with(obj_levelbar) {previous_points = other.points; other.previous_points = previous_points}
		level_set_points(level)
		//levelcompleted = false
		//controls\\
		update_baddies()
		//--------\\
		/*instance_destroy(Gem_1,false)
		delete_gem_lists()*/
		with(Gem_1)
		{
			lvlcomplete = true
			X = x - Board_1.x
		}
		ds_list_clear(list_of_coals) 
		ds_list_clear(list_of_bombs) 
		ds_list_clear(list_of_locks)
		ds_list_clear(list_of_skulls) 
		list_of_doom = noone
		
		with(obj_score) alarm[0] = 60
		with(Board_1) alarm[0] = 60
		with(obj_xplier) alarm[1] = 60
		with(obj_bonus_challenge) alarm[3] = 60
		with(obj_levelbar) alarm[0] = 60
		with(obj_xplier_num) alarm[0] = 60
		with(obj_zenify) alarm[2] = 60
		alarm[6] = 120
	}
}
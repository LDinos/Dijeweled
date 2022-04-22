/// @description Level complete check + cur_time
gems_ready = 0

var prev_shouldmove = should_move //should gems start moving
if (lightOn || hypeOn || fruit_exploding_dontmove || instance_exists(gem_dissappear)) should_move = false
else {
	should_move = true
	if (prev_shouldmove != should_move) {
		update_gems_fallen_array()
		update_gems_to_spawn_array()
		if (must_spawn_gems) {
			must_spawn_gems = false
			spawn_new_gems(Board_1, Gem_1)
		}
	}
}
for(var i=0;i<8;i++) {
	gaps[i] = 7
	for(var j=0;j<8;j++) gems_id_array[i][j] = noone
}
with(Gem_1) {
	if (_i >= 0) {
		Gamerule_1.gems_id_array[_i][_j] = id
		Gamerule_1.gaps[_i]--
	}
	if (acc == 0 && _i == i_limit) other.gems_ready++
}
ready = should_move && !(moving || flameon || fruit_spawning || fruit_exploding || gems_ready != instance_number(Gem_1))

if ready && !levelcompleted
{
	if !IsGemActive {
		if alarm[0] = -1 alarm[0] = 1 //isgemactive1
	}
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
if (global.replay_match_allowed || global.replay_match_isplaying) cur_time++ //this var is used on replay only

// Finish level \\
if (points >= levelpointsneeded) && !time_allowed //if points are more than levelpointsneeded and time is not allowed, we know the progress bar is full
{
	if (levelcompleteallowed) levelbarfull = true
	else levelbarfull = false
}
else levelbarfull = false

if (levelbarfull)
{
	with(obj_bonus_challenge) other.challenge_active = challenge_complete
	if (!levelcompleted) {
		if !instance_exists(Coal_break) && (IsGemActive2) && (ds_list_empty(list_of_fruits)) && (!fruit_want_to_spawn) && (!fruit_spawning) && (!challenge_active) levelcompleted = true
		else levelcompleted = false
	}
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
		levelbarfull = false
		part_particles_clear(global.sys_above_gem)
		part_particles_clear(global.sys_below_gem)
		level_complete_get_powers()
		spawnallowed = false
		level++
		discord_update_presence(global.DIS_name,"Level " + string(Gamerule_1.level),"ico_512","")
		#region secret
		if (level == 10) //secret unlock
		{
			if (room == rm_timeattack)
			{
				gamemode_unlock(MODE_TWIST, 0, 512)
			}
			else if (room == rm_zen)
			{
				gamemode_unlock(MODE_COMPACT, 0, 512)
			}
		}
		#endregion
		audio_play_sound(vo_levelcomplete,0,0)
		instance_create_depth(Board_1.x + 32 + Board_1.sprite_width/3 ,Board_1.y + 32 + Board_1.sprite_height/3,-15,obj_levelcompletetext)
		with(obj_levelbar) {show_full = true; previous_points = other.points; other.previous_points = previous_points}
		level_set_points(level)
		update_baddies()
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
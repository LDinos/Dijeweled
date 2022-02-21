/// @description Insert description here
// You can write your code in this editor
Gamerule_1.isQuest = true
instance_create(0,0, obj_makezenbkg)
file_delete("CHK")
checkpoint = 0 //used for UNDO
gems0doonce = false
conditions = 0
custom_quest = false
victory = false //we have done all critirea
loss = false //for when limiter criteria is met
amdone = false //doonce for challenge completion
alarm[1] = 1 // Discord

#region STATS
S_destroyed_locks = 0
S_destroyed_bombs = 0
S_destroyed_dooms = 0
S_destroyed_ice = 0
S_destroyed_flames = 0
S_destroyed_lights = 0
S_destroyed_novas = 0
S_destroyed_septas = 0
S_destroyed_octas = 0
S_destroyed_hypes = 0
S_destroyed_coals = 0
S_destroyed_skulls = 0
S_destroyed_fruits = 0
S_destroyed_gems = 0
S_matched_gems = 0
S_num_flames = 0
S_num_lights = 0
S_num_novas = 0
S_num_septas = 0
S_num_octas = 0
S_num_hypes = 0
S_num_coals = 0
//S_num_points = 0
S_num_zenifycombo = 0
S_num_red = 0
S_num_green = 0
S_num_orange = 0
S_num_blue = 0
S_num_white = 0
S_num_yellow = 0
S_num_purple = 0
S_num_fruits = 0
S_best_cascade = 0
S_gemcombo = 0 //becomes best_gemcombo if onvemove = true
S_movesdone = 0

#endregion

#region LIMITERS
L_noslightning = -1 //-1 disabled, 0 enabled, 1 means activated
L_onemove = false //whatever condition must be done in one move if true
L_movesleft = -1 //game over after an amount of moves done
L_time = -1 //do we have a timer?
L_drain = -1 //do we drain the progress bar? Insert multiplier here (1 being default)
L_badgem = false //activated if companion dies here
L_nospecialgems = -1 //-1 deactivated, 0 activated, 1 triggered. Player loses if special gems are activated
L_nospecialgems_endgame = 1 //0 false, 1 true
L_noslightning_endgame = 0 //0 false, 1 true
#endregion

#region CONDITIONS (-1 or false = disabled)

C_gemsare0 = false //must destroy all gems
C_summoves = -1 //must have a number of possible matches
C_cascades = -1 //must do a number of cascades
C_destroy_fruits = -1
C_destroy_hype = -1
C_destroy_locks = -1 //must destroy an amount of locks
C_destroy_bombs = -1 //must destroy an amount of locks
C_destroy_skulls = -1 //must destroy an amount of locks
C_destroy_dooms = -1 //must destroy an amount of locks
C_destroy_ice = -1 //must destroy an amount of ice
C_destroy_coals = -1 //must destroy a number of coals
C_destroy_gems = -1 //must destroy a number of gems
C_match_gems = -1 //must match a number of gems
C_destroy_flame = -1 //must destroy a number of flames
C_destroy_lightning = -1 //must destroy a number of lightnings
C_destroy_nova = -1 //must destroy a number of novas
C_destroy_septa = -1 //must destroy a number of septas
C_destroy_octa = -1 //must destroy a number of octas
C_num_green = -1 //must have a number of green gems on board
C_num_red = -1 //must have a number of red gems on board
C_num_blue = -1 //must have a number of blue gems on board
C_num_yellow = -1 //must have a number of yellow gems on board
C_num_white = -1 //must have a number of white gems on board
C_num_purple = -1 //must have a number of purple gems on board
C_num_orange = -1 //must have a number of orange gems on board
C_num_coals = -1 //must have a number of coal gems on board
C_num_flame = -1 //must create a number of flame gems
C_num_lightning = -1 //must create a number of lightnings
C_num_nova = -1 //must create a number of novas
C_num_septa = -1 //must create a number of septas
C_num_octa = -1 //must create a number of octas
C_num_hype = -1 //must create a number of hypercubes
C_num_points = -1 //must score an amount of points
C_num_fruits = -1
C_num_zenifycombo = -1 //must score a combo in zenify
C_num_chain = -1 //must do a specific amount of chains
C_pattern_enabled = false //must create a number of hypercubes
for(var i = 0; i < 8 ; i++)
{
	for(var j = 0; j < 8 ; j++)
	{
		C_pattern_isOn[i][j] = false
		C_pattern[i][j] = -1
	}
}
	//C_pattern[i][j] if above true, make this thing here in room create event
	//VALUES: 0-6 SKINS, 7 COAL/HYPE, -1 ANYTHING/NOT NEEDED
C_movesneeded = -1 //must do an amount of moves to win
//38
#endregion
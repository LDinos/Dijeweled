///DELETE ME AFTER\\\
/*var i = 0;
var j = 0;
var path = "challenges/challenge"
while(file_exists(path+string(i)+string(j)+".ini"))
{
	if j < 5 j++
	else {j = 0; i++}
}
var f = path+string(i)+string(j)+".ini"*/
///\\\
var f = working_directory +"/CustomQuests/"+string(global.challenge_index) + ".ini" //UNCOMMENT ME \\
ini_open(f)
	#region GENERAL
		var s = "General"
		ini_write_real(s,"hypeallowed",CUS_general_hypercubes.enabled)
		ini_write_real(s,"multiswapallowed",CUS_general_multiswap.enabled)
		ini_write_real(s,"illegalsallowed",CUS_general_matchless.enabled)
		ini_write_real(s,"pointsallowed",CUS_general_points.enabled)
		ini_write_real(s,"spawnallowed",CUS_general_spawn.enabled)
		ini_write_real(s,"AHMallowed",CUS_general_ahm.enabled)
		ini_write_real(s,"loseonnomoves",CUS_general_loseonno.enabled)
		ini_write_real(s,"time",real(CUS_general_time.value))
		ini_write_real(s,"xplierallowed",CUS_general_xplier.enabled)
		ini_write_real(s,"challengeallowed",CUS_general_chlbonus.enabled)
		ini_write_real(s,"wheelallowed",CUS_general_wheel.enabled)
		ini_write_real(s,"difficulty",real(CUS_general_difficulty.value))
		//ini_write_real(s,"undoallowed",CUS_general_undo.enabled)
		ini_write_real(s,"skinnum",real(CUS_general_skins.value))
		ini_write_string(s,"description",CUS_general_description.value)
		ini_write_string(s,"creator",global.user)
	#endregion
	
	#region OBJECTIVES
		var s = "Objectives"
		var i = 1
		with(CUS_objective)
		{
			ini_write_real(s,"objective_"+string(i),hover)
			ini_write_real(s,"value_"+string(i),real(text2))
			ini_write_string(s,"name_"+string(i),text)
			ini_write_real(s,"isticked_"+string(i),amticked)
			
			if image_index = 2
			{
				var str = ds_grid_write(board)
				ini_write_string(s,"board_"+string(i),str)
			}
			i++		
		}
		ini_write_real(s,"num_objectives",i-1)
	#endregion
	
	#region BOMBS
		var s = "Bombs"
		ini_write_real(s,"allowed",obj_CUS_bombs.enabled)
		if obj_CUS_bombs.enabled
		{
		ini_write_real(s,"turns",real(CUS_bombs_turns.value))
		ini_write_real(s,"counter",real(CUS_bombs_counter.value))
		ini_write_real(s,"max",real(CUS_bombs_max.value))
		}
	#endregion
	
	#region DOOM
		var s = "Doom"
		ini_write_real(s,"allowed",obj_CUS_doom.enabled)
		if obj_CUS_doom.enabled
		{
		ini_write_real(s,"counter",real(CUS_doom_counter.value))
		}
	#endregion
	
	#region SKULLS
		var s = "Skulls"
		ini_write_real(s,"allowed",obj_CUS_skulls.enabled)
		if obj_CUS_skulls.enabled
		{
		ini_write_real(s,"counter",real(CUS_skull_counter.value))
		ini_write_real(s,"max",real(CUS_skull_max.value))
		}
	#endregion
	
	#region LOCKS
		var s = "Locks"
		ini_write_real(s,"allowed",obj_CUS_locks.enabled)
		if obj_CUS_locks.enabled
		{
		ini_write_real(s,"turns",real(CUS_locks_turns.value))
		ini_write_real(s,"max",real(CUS_locks_max.value))
		}
	#endregion
	
	#region COALS
		var s = "Coals"
		ini_write_real(s,"allowed",obj_CUS_coals.enabled)
		if obj_CUS_coals.enabled
		{
		ini_write_real(s,"turns",real(CUS_coals_turns.value))
		ini_write_real(s,"max",real(CUS_coals_max.value))
		ini_write_real(s,"random",CUS_coals_random.enabled)
		ini_write_real(s,"chance",real(CUS_coals_chance.value))
		}
	#endregion
	
	#region ICE
		var s = "Ice"
		ini_write_real(s,"allowed",obj_CUS_ice.enabled)
		if obj_CUS_ice.enabled
		{
		ini_write_real(s,"turns",real(CUS_ice_turns.value))
		ini_write_real(s,"max",real(CUS_ice_max.value))
		}
	#endregion
	
	#region COMPANION
		var s = "Companion"
		ini_write_real(s,"allowed",obj_CUS_companion.enabled)
		if obj_CUS_companion.enabled
		{
		ini_write_real(s,"num",real(CUS_companion_num.value))
		ini_write_real(s,"locked",CUS_companion_locked.enabled)
		}
	#endregion	
	
	#region BOARD
		var s = "Board"
		var str = ds_grid_write(obj_CUS_board.board)
		ini_write_string(s,"board",str)
	#endregion
ini_close()

#region change allowances
	/*var MATCHLESS = convert_num_to_tick(CUS_general_matchless.enabled)
	var DIFFICULTY = real(CUS_general_difficulty.value)
	var CHLBONUS = convert_num_to_tick(CUS_general_chlbonus.enabled)
	var MULTISWAP = convert_num_to_tick(CUS_general_multiswap.enabled)
	var HYPES = convert_num_to_tick(CUS_general_hypercubes.enabled)
	var XPLIER = convert_num_to_tick(CUS_general_xplier.enabled)
	var BOMBS = convert_num_to_tick(obj_CUS_bombs.enabled)
	var DOOMS = convert_num_to_tick(obj_CUS_doom.enabled)
	var SKULLS = convert_num_to_tick(obj_CUS_skulls.enabled)
	var LOCKS = convert_num_to_tick(obj_CUS_locks.enabled)
	var ICE = convert_num_to_tick(obj_CUS_ice.enabled)
	var COALS = convert_num_to_tick(obj_CUS_coals.enabled)
	if real(CUS_general_time.value) > 0 
	{
		var TIME = convert_seconds_to_time(real(CUS_general_time.value)) 
	}
	else {var TIME = "untick"}

	ini_open("challenges.ini")
		var key = "26:"+string(global.challenge_index)
	
		ini_write_string("Challenges",key,CUS_general_description.value)
		ini_write_string("Info",key + "-Challenge Bonus",CHLBONUS)
		ini_write_string("Info",key + "-Matchless Moves",MATCHLESS)
		ini_write_string("Info",key + "-Multiplier",XPLIER)
		ini_write_string("Info",key + "-multiswap_allowed",MULTISWAP)
		ini_write_string("Info",key + "-Hypercubes",HYPES)
		ini_write_string("Info",key + "-Bombs",BOMBS)
		ini_write_string("Info",key + "-Dooms",DOOMS)
		ini_write_string("Info",key + "-Skulls",SKULLS)
		ini_write_string("Info",key + "-Locks",LOCKS)
		ini_write_string("Info",key + "-Ice",ICE)
		ini_write_string("Info",key + "-Coals",COALS)
		ini_write_string("Info",key + "-Time",TIME)
		ini_write_real("Info",key + "-Difficulty",DIFFICULTY)

	ini_close()*/
#endregion
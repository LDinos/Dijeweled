///@param iscustom
function load_custom_quest(argument0) {
	var zentrue = false //if it becomes true later, we will move the undo/reset position to the right
	var file = working_directory+"challenges/challenge" +string(global.challenge_index)+".ini" //path for quests
	obj_quest_control.custom_quest = false
	if argument0 //if is custom quest
	{
		file = working_directory +"/CustomQuests/"+string(global.challenge_index)+".ini"; //path for custom quests
		obj_quest_control.custom_quest = true
	
	}
	ini_open(file)
		if !argument0
		{
		#region MUSIC
			var mus = ini_read_real("General","mus",0)
			switch mus
			{
				case 0:
					with(obj_questmusic)
					{
						danger_enable = true
						mus_main = mus_timerunning
						mus_danger = mus_timerunning_danger
						mus_win = mus_takeyourtimewin
						mus_loss = mus_takeyourtimeloss
						event_user(0)
					}
					break;
				case 1:
					with(obj_questmusic)
					{
						danger_enable = false
						mus_main = mus_takeyourtime
						mus_win = mus_takeyourtimewin
						mus_loss = mus_takeyourtimeloss
						event_user(0)
					}
					break;
				case 2:
					with(obj_questmusic)
					{
						danger_enable = false
						mus_main = mus_challenge1
						mus_win = mus_challenge1_win
						mus_loss = mus_challenge1_loss
						event_user(0)
					}
					break;
				case 3:
					with(obj_questmusic)
					{
						danger_enable = false
						mus_main = mus_challenge2
						mus_win = mus_challenge2_win
						mus_loss = mus_challenge2_loss
						event_user(0)
					}
					break;
			}
		#endregion
		}
	#region GENERAL
			var s = "General"
			Gamerule_1.num_skin = ini_read_real(s,"skinnum",7) - 1
			Gamerule_1.wheel_spinner_allowed = ini_read_real(s,"wheelallowed",0)
			var challengeallowed = ini_read_real(s,"challengeallowed",0) //NOT DONE
			//check later where to put it
			var xplierallowed = ini_read_real(s,"xplierallowed",0) //NOT DONE
			if xplierallowed 
			{
				instance_create(64+32,608-16,obj_xplier); 
				instance_create(128+32,544-16,obj_xplier_num)
			}
			var t = ini_read_real(s,"time",0)
			if t > 0
			{
				Gamerule_1.time_allowed = true
				instance_create(576,1088,obj_timebar)
				with(obj_timebar)
				{
					time_full = t
					time_now = t
				}
				obj_quest_control.L_time = 1
			}
			Gamerule_1.end_on_nomoves = ini_read_real(s,"loseonnomoves",0)
			Gamerule_1.AHM_allowed = ini_read_real(s,"AHMallowed",1)
			if (!Gamerule_1.AHM_allowed && !Gamerule_1.end_on_nomoves) Gamerule_1.force_moves_allowed = true
			Gamerule_1.spawnallowed = ini_read_real(s,"spawnallowed",1)
			Gamerule_1.points_allowed = ini_read_real(s,"pointsallowed",1)
			Gamerule_1.illegals_allowed = ini_read_real(s,"illegalsallowed",1)
			Gamerule_1.multiswap_allowed = ini_read_real(s,"multiswapallowed",1)
			Gamerule_1.hypeallowed = ini_read_real(s,"hypeallowed",1)
	#endregion
	
	#region BOARD / COMPANION
			if !Gamerule_1.spawnallowed
			{
				var bo = ds_grid_create(8,8)
				var str = ini_read_string("Board","board","")
				ds_grid_read(bo,str)
				for(var i = 0; i<8; i++)
				{
					for(var j = 0; j<8; j++)
					{
						var skn = bo[# i,j] mod 10
						var pow = bo[# i,j] div 10
						if bo[# i,j] != -1
						{
							var g = instance_create(Board_1.x + j*64, Board_1.y + i*64, Gem_1)
							if (skn < 8) with(g) {set_skin(skn)}
							else
							{
								with(g)
								{
									set_skin(7)
									amHype = true
								}
							}
						
							if (pow < 7) g.gempower = pow
							else
							{
								g.amLocked = 1
								ds_list_add(Gamerule_1.list_of_locks,g)
							}
						
						}
					}
				}
			}
			else
			{
				instance_create(576,544,spawner1)
				Gamerule_1.spawnallowed = true
				var s = "Companion"
				var istrue = ini_read_real(s,"allowed",0)
				if istrue
				{
					var n = ini_read_real(s,"num",1)
					var islocked = ini_read_real(s,"locked",0)
					repeat(n)
					{
						make_companion(islocked)
					}
				}
			}
	#endregion
	
	#region BOMBS
			var s = "Bombs"
			var istrue = ini_read_real(s,"allowed",0)
			if istrue
			{
				var c = instance_create(0,0,obj_bombcontrol)
				var v1 = ini_read_real(s,"turns",0)
				var v2 = ini_read_real(s,"counter",0)
				var v3 = ini_read_real(s,"max",0)
				with(c)
				{
					BombSpawnLevelMin = -1
					TurnsToSpawnLevelBased = false
					BombCounterLevelBased = false
					BombExaggerate = -1
					TurnsToSpawnDefault = v1
					TurnsToSpawn = TurnsToSpawnDefault; //After how many turns will a bomb spawn? This changes every level if it is level based.
					TurnsToSpawnCur = TurnsToSpawn //This gets decreased every turn. after going to 0, it becomes TurnsToSpawn again.
					BombCounterDefault = v2 //The value to give to the newly spawned bomb
					BombCounter = BombCounterDefault //The value to give to the newly spawned bomb
					BombMax = v3
				}
			}
	#endregion
	
	#region DOOM
			var s = "Doom"
			var istrue = ini_read_real(s,"allowed",0)
			if istrue
			{
				var c = instance_create(0,0,obj_doom_control)
				var v1 = ini_read_real(s,"counter",0)
				with(c)
				{
					DoomSpawnLevelMin = -1 //When do we start allowing dooms to spawn? (-1 = infinite)
					DoomSpawnLevelMax = -1 //When do we stop allowing dooms? (-1 = infinite)
					DoomSpawnInstant = true//Should it spawn every time it gets destroyed?

					DoomCounterLevelBased = false //Is the counter of the Dooms a level based variable?
					DoomCounterDefault = v1 //The value to give to the newly spawned Doom
					DoomCounter = DoomCounterDefault //The value to give to the newly spawned Doom
				}
			}
	#endregion
	
	#region SKULL
			var s = "Skulls"
			var istrue = ini_read_real(s,"allowed",0)
			if istrue
			{
				var c = instance_create(0,0,obj_skull_control)
				var v1 = ini_read_real(s,"counter",0)
				var v2 = ini_read_real(s,"max",0)
				with(c)
				{
					SkullCounterLevelBased = false //Is the counter of the Skulls a level based variable?
					SkullCounterDefault = v1 //The value to give to the newly spawned Skull
					SkullCounter = SkullCounterDefault //The value to give to the newly spawned Skull
					SkullMax = v2
				}
			}
	#endregion
	
	#region LOCKS
			var s = "Locks"
			var istrue = ini_read_real(s,"allowed",0)
			if istrue
			{
				var c = instance_create(0,0,obj_lock_control)
				var v1 = ini_read_real(s,"turns",0)
				var v2 = ini_read_real(s,"max",0)
				with(c)
				{
					LockSpawnLevelMin = -1 //When do we start allowing coals to spawn? (-1 = infinite)
					TurnsToSpawnLevelBased = false
					TurnsToSpawnDefault = v1 //first ever default value
					TurnsToSpawn = v1; //After how many turns will a coal spawn? This changes every level if it is level based.
					TurnsToSpawnCur = TurnsToSpawn //This gets decreased every turn. after going to 0, it becomes TurnsToSpawn again.
					LockMax = v2 //Max amount of coals on screen
				}
			}
	#endregion
	
	#region ICE LOCKS
			var s = "Ice"
			var istrue = ini_read_real(s,"allowed",0)
			if istrue
			{
				var c = instance_create(0,0,obj_ice_lock_control)
				var v1 = ini_read_real(s,"turns",0)
				var v2 = ini_read_real(s,"max",0)
				with(c)
				{
					LockSpawnLevelMin = -1 //When do we start allowing coals to spawn? (-1 = infinite)
					TurnsToSpawnLevelBased = false
					TurnsToSpawnDefault = v1 //first ever default value
					TurnsToSpawn = v1; //After how many turns will a coal spawn? This changes every level if it is level based.
					TurnsToSpawnCur = TurnsToSpawn //This gets decreased every turn. after going to 0, it becomes TurnsToSpawn again.
					LockMax = v2 //Max amount of coals on screen
				}
			}
	#endregion
	
	#region COALS
			var s = "Coals"
			var istrue = ini_read_real(s,"allowed",0)
			if istrue
			{
				var c = instance_create(0,0,obj_coal_control)
				var v1 = ini_read_real(s,"turns",0)
				var v2 = ini_read_real(s,"max",0)
				var v3 = ini_read_real(s,"random",0)
				var v4 = ini_read_real(s,"chance",0)
				with(c)
				{
					CoalSpawnLevelMin = -1
					TurnsToSpawnRandom = v3 //Is the turns to spawn randomized? If so, it wont be levelbased
					TurnsToSpawnChance = v4
					TurnsToSpawnDefault = v1 //first ever default value
					TurnsToSpawn = v1; //After how many turns will a coal spawn? This changes every level if it is level based.
					TurnsToSpawnCur = TurnsToSpawn //This gets decreased every turn. after going to 0, it becomes TurnsToSpawn again.
					CoalMax = v2
				}
			}
	#endregion
	
	#region OBJECTIVES
			var s = "Objectives"
			var n = ini_read_real(s,"num_objectives",1)
			if challengeallowed
			{
				var h = 1024
				if (n > 4) h+=64
				instance_create(64+32,h+32,obj_bonus_challenge)
			}
			for(i=1;i<=n;i++)
			{
				var type = ini_read_real(s,"objective_"+string(i),0) //objective type (is it 0? (gemsare0) etc)
				var value = ini_read_real(s,"value_"+string(i),0)
			#region TYPE FINDING
					switch type
					{
						case 0:
							obj_quest_control.C_gemsare0 = true
							if !Gamerule_1.spawnallowed && !Gamerule_1.multiswap_allowed
							{
								instance_create(192-64, 992-64-32-8, obj_button_undo)
								instance_create(192-64, 992-32+8, obj_button_reset)
							}
							break;
						case 1:
							obj_quest_control.C_summoves = value
							break;
						case 2:
							obj_quest_control.C_cascades = value
							break;
						case 3:
							obj_quest_control.C_destroy_fruits = value
							break;
						case 4:
							obj_quest_control.C_destroy_hype = value
							break;
						case 5:
							obj_quest_control.C_destroy_locks = value
							break;
						case 6:
							obj_quest_control.C_destroy_bombs = value
							break;
						case 7:
							obj_quest_control.C_destroy_skulls = value
							break;
						case 8:
							obj_quest_control.C_destroy_dooms = value
							break;
						case 9:
							obj_quest_control.C_destroy_ice = value
							break;
						case 10:
							obj_quest_control.C_destroy_coals = value
							break;
						case 11:
							obj_quest_control.C_destroy_gems = value
							break;
						case 12:
							obj_quest_control.C_match_gems = value
							break;
						case 13:
							obj_quest_control.C_destroy_flame = value
							break;
						case 14:
							obj_quest_control.C_destroy_lightning = value
							break;
						case 15:
							obj_quest_control.C_destroy_nova = value
							break;
						case 16:
							obj_quest_control.C_destroy_septa = value
							break;
						case 17:
							obj_quest_control.C_destroy_octa = value
							break;
						case 18:
							obj_quest_control.C_num_green = value
							break;
						case 19:
							obj_quest_control.C_num_red = value
							break;
						case 20:
							obj_quest_control.C_num_blue = value
							break;
						case 21:
							obj_quest_control.C_num_yellow = value
							break;
						case 22:
							obj_quest_control.C_num_white = value
							break;
						case 23:
							obj_quest_control.C_num_purple = value
							break;
						case 24:
							obj_quest_control.C_num_orange = value
							break;
						case 25:
							obj_quest_control.C_num_coals = value
							break;
						case 26:
							obj_quest_control.C_num_flame = value
							break;
						case 27:
							obj_quest_control.C_num_lightning = value
							break;
						case 28:
							obj_quest_control.C_num_nova = value
							break;
						case 29:
							obj_quest_control.C_num_septa = value
							break;
						case 30:
							obj_quest_control.C_num_octa = value
							break;
						case 31:
							obj_quest_control.C_num_hype = value
							break;
						case 32:
							obj_quest_control.C_num_points = value
							Gamerule_1.points = 0 
							Gamerule_1.points_allowed = true
							break;
						case 33:
							obj_quest_control.C_num_fruits = value
							break;
						case 34:
							obj_quest_control.C_num_zenifycombo = value
							var zentrue = true
							var h = 992
							if (n > 4) h+=64
							var z = instance_create(192+32,992-32,obj_zenify)
							z.zen_multiplier = 3
							z.zen_countdown_multiplier = 0.5
							break;
						case 35:
							obj_quest_control.C_num_chain = value
							break;
						case 36:
							obj_quest_control.C_pattern_enabled = true
							var b = ds_grid_create(8,8)
							var str = ini_read_string(s,"board_"+string(i),"")
							ds_grid_read(b,str)
							for(var k = 0; k <8; k++)
							{
								for(var l = 0; l<8; l++)
								{
									obj_quest_control.C_pattern[k,l] = b[# k,l]
								}
							}
							ds_grid_destroy(b)
							break;
						case 37:
							obj_quest_control.C_movesneeded = value
							break;
						case 42:
							obj_quest_control.L_noslightning = 0
							obj_quest_control.L_noslightning_endgame = ini_read_real(s,"isticked_"+string(i),0)
							break;
						case 43:
							obj_quest_control.L_onemove = true
							break;
						case 44:
							obj_quest_control.L_movesleft = value
							break;
						case 45:
							obj_quest_control.L_drain = value
							Gamerule_1.points_allowed = true
							instance_create(576,1088,obj_pointbar)
							with(obj_timebar) y+=64-16
							break;
						case 46:
							obj_quest_control.L_nospecialgems = 0
							obj_quest_control.L_nospecialgems_endgame = ini_read_real(s,"isticked_"+string(i),1)
							break;
<<<<<<< HEAD
=======
						case 47:
							obj_quest_control.L_endless = true;
							break;
						case 48:
							obj_quest_control.L_pointslimit = value;
							break;
>>>>>>> 1.9
					}
			#endregion
			}
		
			if obj_quest_control.L_drain > -1 
			{
				if obj_quest_control.C_num_points = -1
				{
					obj_quest_control.C_num_points = 10000
				}
				Gamerule_1.points = obj_quest_control.C_num_points div 2
			}
		
	#endregion
	if zentrue 
	{
		with(obj_button_undo) x+=128+32+64
		with(obj_button_reset) x+=128+32+64
	}
	ini_close()


}

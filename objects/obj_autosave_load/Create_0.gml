/// @description Loads the autosaved file
if file_exists("autosave_"+string(room_get_name(room)))
{
	ini_open("autosave_"+string(room_get_name(room)))
	var map = ds_map_create()
	var data = ini_read_string("map","data","")
	ds_map_read(map,data)
		//GEMS\\
			for(var i=0;i<8;i++)
			{
				for(var j=0;j<8;j++)
				{
					var str = string(i) + "-" + string(j)
					var GEMSKIN = map[? str+"skinnum"]
					if GEMSKIN != -1
					{
						var GEMPOWER = map[? str+"gempower"]
						var AMHYPE = map[? str+"amHype"]
						var AMINV = map[? str+"amInvisible"]
						var AMBOMB = map[? str+"amBomb"]
						var AMLOCKED = map[? str+"amLocked"]
						var AMBEINGLOCKED = map[? str+"amBeingLocked"]
						var COUNTDOWN = map[? str+"countdown"]
						var FRUITEXPLODING= map[? str+"amFruitExploding"]
						var GEODENUM = map[? str+"geodenum"]
						for(var K = 1; K <= GEODENUM; K++)
						{
						GEODENUM_POINTS[K-1] = map[? str+"geodenum_points" + string(K)]
						}
						
						with(spawner1)
						{
							var my_x = Board_1.x + 64*j
							var dif = 1 //spawn gems 1 pixel up so gemactive will be enabled
							if AMLOCKED = 3 dif = 0 //dont do that to ice locks
							var my_y = Board_1.y - 64*(7-i) + 64*7 - dif
							
							var Gem = instance_create_depth(my_x, my_y,-1,Gem_1)
							Gem.gempower = GEMPOWER
							Gem.amHype = AMHYPE
							with(Gem) set_skin(GEMSKIN)
							//Gem.skinnum = my_skin
							//Gem.image_index = my_skin
							Gem.amBomb = AMBOMB
							Gem.amLocked = AMLOCKED
							Gem.countdown = COUNTDOWN
							Gem.amInvisible = AMINV
							Gem.amFruitExploding = FRUITEXPLODING
							Gem.amBeingLocked = AMBEINGLOCKED
							Gem.geodenum_points = -1
							Gem.geodenum = GEODENUM
							for(var K = 1; K<=GEODENUM; K++) Gem.geodenum_points[K-1] = other.GEODENUM_POINTS[K-1]
							if !AMINV
							{
								if AMBEINGLOCKED = 1 && AMLOCKED = 0 //In the case where the lock is settling, both ambeinglocked and amlocked are true. We want the case w
								{
								 var app = instance_create(x,y,lockAppear)
								 app.mygem = Gem
								}
								else if AMBEINGLOCKED = 2 && AMLOCKED = 0 //In the case where the lock is settling, both ambeinglocked and amlocked are true. We want the case w
								{
								 var app = instance_create(x,y,doomAppear)
								 app.mygem = Gem
								}
								else if AMBEINGLOCKED = 3 && AMLOCKED = 0 //In the case where the lock is settling, both ambeinglocked and amlocked are true. We want the case w
								{
								 var app = instance_create(x,y,iceAppear)
								 app.mygem = Gem
								}
								else if AMBEINGLOCKED = 4 && AMLOCKED = 0 //In the case where the lock is settling, both ambeinglocked and amlocked are true. We want the case w
								{
								 var app = instance_create(x,y,skullAppear)
								 app.mygem = Gem
								}
								else if AMLOCKED = 1 //In the case where the lock is settling, both ambeinglocked and amlocked are true. We want the case w
								{
									 if AMBEINGLOCKED = 1
									 {
									 var app = instance_create(x,y,lock_settling)
									 app.mygem = Gem
									 }
								 ds_list_add(Gamerule_1.list_of_locks,Gem)
								}
								else if AMLOCKED = 2 //In the case where the lock is settling, both ambeinglocked and amlocked are true. We want the case w
								{
									if AMBEINGLOCKED = 2
									{
									 var app = instance_create(x,y,doom_settling)
									 app.mygem = Gem
									}
								 Gamerule_1.list_of_doom = Gem
								}
								else if AMLOCKED = 3 //In the case where the lock is settling, both ambeinglocked and amlocked are true. We want the case w
								{
									if AMBEINGLOCKED = 3
									{
									 var app = instance_create(x,y,ice_settling)							 
									 app.mygem = Gem
									}
								 ds_list_add(Gamerule_1.list_of_ice_locks,Gem)
								}
								else if AMLOCKED = 4
								{
									ds_list_add(Gamerule_1.list_of_skulls,Gem)
								}

								if FRUITEXPLODING ds_list_add(Gamerule_1.list_of_fruits,Gem)
								if (AMBOMB) ds_list_add(Gamerule_1.list_of_bombs,Gem)
								else if (GEMSKIN = 7 && AMLOCKED = 0) ds_list_add(Gamerule_1.list_of_coals,Gem)
							}
						
						}
						Gamerule_1.gem_board1[i,j] = Gem
						Gamerule_1.gemboard[i,j] = GEMSKIN
					}
				}
			}
			spawner1.spawnallowed = true
		//POINTS AND LEVEL\\
			Gamerule_1.points = map[? "points"]
			Gamerule_1.compliment_points = map[? "compliment_points"]
			Gamerule_1.combo = map[? "combo"]
			Gamerule_1.gemdestroyonemove = map[? "gemdestroyonemove"]
			Gamerule_1.level = map[? "level"]
			Gamerule_1.levelpointsneeded = map[? "levelpointsneeded"]
			Gamerule_1.bomb_danger = map[? "bomb_danger"]
			Gamerule_1.bomb_win = map[? "bomb_win"]
			Gamerule_1.previous_points = map[? "previous_points"]
			Gamerule_1.Moves_Made = map[? "moves_made"]
			if is_undefined(Gamerule_1.Moves_Made) Gamerule_1.Moves_Made = 0
			Gamerule_1.IsGemActive = 0
			with(obj_levelbar) previous_points = Gamerule_1.previous_points
			
		//XPLIER\\
		Gamerule_1.xplier = map[? "xplier"]

			if instance_exists(obj_xplier)
			{				
				obj_xplier.fill_to_go = map[? "fill_to_go"]
				obj_xplier.def_filler = map[? "def_filler"]
				obj_xplier.xplier_real = map[? "xplier_real"]
				
				with(obj_xplier)
				{
					alarm[0] = 1
					var xplier = Gamerule_1.xplier
					if xplier_real = 11 sprite_index = spr_xplier_flow_rainbow
					if xplier <= 4
					{
						bar_gap = (64/xplier)
						bar_sprite = xplier - 1
					}
					else
					{
						bar_gap = 16 //16 pixels per gap
						bar_sprite = 3 //1 bars
					}
				}
			}
		//CHALLENGE\\
			if instance_exists(obj_bonus_challenge)
			{
				for(i=0;i<4;i++)
				{
					obj_bonus_challenge.bonus[i] = map[? "bonus"+string(i)]				
				}
				obj_bonus_challenge.bonus_index = map[? "bonus_index"]
				
				for(i=0;i<=obj_bonus_challenge.bonus_index;i++)
				{
					obj_bonus_challenge.bonus_lit[i] = true
				}
				with(obj_bonus_challenge) alarm[0] = 1
				
				obj_bonus_challenge.challenge_complete = map[? "challenge_complete"]
				obj_bonus_challenge.sperm = map[? "sperm"]
				
				if obj_bonus_challenge.challenge_complete
				{
					with(obj_bonus_challenge) {alarm[1] = -1; alarm[5] = 1}
					with(obj_bonus_doors) {alarm[0] = -1}
				}
			}
		//BOMB CONTROLS\\
			if instance_exists(obj_bombcontrol)
			{
				obj_bombcontrol.TurnsToSpawn = map[? "bomb_TurnsToSpawn"]
				obj_bombcontrol.TurnsToSpawnCur = map[? "bomb_TurnsToSpawnCur"]
				obj_bombcontrol.BombCounter = map[? "bomb_BombCounter"]
			}
		//COAL CONTROLS\\
			if instance_exists(obj_coal_control)
			{
				obj_coal_control.TurnsToSpawn = map[? "coal_TurnsToSpawn"]
				obj_coal_control.TurnsToSpawnCur = map[? "coal_TurnsToSpawnCur"]
			}
		//LOCK CONTROLS\\
			if instance_exists(obj_lock_control)
			{
				obj_lock_control.TurnsToSpawn = map[? "lock_TurnsToSpawn"]
				obj_lock_control.TurnsToSpawnCur = map[? "lock_TurnsToSpawnCur"]
			}
		//LOCK CONTROLS\\
			if instance_exists(obj_ice_lock_control)
			{
				obj_ice_lock_control.TurnsToSpawn = map[? "icelock_TurnsToSpawn"]
				obj_ice_lock_control.TurnsToSpawnCur = map[? "icelock_TurnsToSpawnCur"]
			}
		//DOOM CONTROLS\\
			if instance_exists(obj_doom_control)
			{
				obj_doom_control.DoomAlreadySpawnedOnce = map[? "doom_DoomAlreadySpawnedOnce"]
				obj_doom_control.DoomCounter = map[? "doom_DoomCounter"]
			}
			
		//SEED\\
		//var seed = map[? "seed"]
				//random_set_seed(seed)
		//BACKGROUND\\
				if instance_exists(obj_background_shadered)
				{
					obj_background_shadered.shd = map[? "shd"]
				}
		//ZENIFY\\
			if instance_exists(obj_zenify)
			{
				//if ds_map_exists(map,"zenify_index")
				{
					//show_message("boi")
					var in = map[? "zenify_index"]
					if is_undefined(in) in = 0
					obj_zenify.index = in
					obj_zenify.index_temp = obj_zenify.index
					with(obj_zenify) if index != 0 event_user(0)
				}
			}
ini_close()
	with(Gamerule_1) 
	{
		IsGemActive = true
		
		#region gem_board1
		for(i=global.board_rows-1;i>=0;i--)
			{
				for(j=7;j>=0;j--)
				{

					gem_board1[i,j] = noone	
				}
			}
		with(Gem_1)
			{
				if _i >= 0
				{
					other.gem_board1[_i,_j] = id
					other.gemboard[_i,_j] = skinnum
				}
			}
		#endregion
		
		matcher_stepevent(Gem_1)
	}
	make_gems_fallen(Gamerule_1)
	with(Gem_1) if amInvisible delete_gem()
}
/// @description Insert description here
if mouse_check_pressed_me(mb_left) || keyboard_check_pressed(ord("R")) || gamepad_button_check_pressed(global.gp[0],global.GP_replay)
{
if canclick && !Gamerule_1.isReplay && !Gamerule_1.levelcompleted
{
	if Gamerule_1.level != Gamerule_1.atm_level {with(obj_makezenbkg) {bkg-=2 event_user(0)}}
	instance_create(room_width-32,512+32,obj_replay_dot)
	Gamerule_1.cur_bomb_danger = Gamerule_1.bomb_danger
	Gamerule_1.cur_bomb_win = Gamerule_1.bomb_win
instance_destroy(obj_fruit_spawner,false)
instance_destroy(lockAppear,false)
instance_destroy(doomAppear,false)
instance_destroy(Gem_1,false)
Gamerule_1.isReplay = true
Gamerule_1.IsGemActive = false
Gamerule_1.IsGemActive2 =false
with(obj_background_shadered)
{
	ds_map_add(Gamerule_1.Replay_map, "background_nextlevel", shd)
	shd = Gamerule_1.Replay_map[? "background"]
}
with(Gamerule_1)
{
	delete_gem_lists()
	fruit_spawning = false
	clear_lists()
	list_of_doom = noone
	if ds_map_exists(Gamerule_1.Replay_map, "illegals_allowed") replay_illegals_allowed = Gamerule_1.Replay_map[? "illegals_allowed"]
	points = atm_points
	xplier = atm_xplier
	level = atm_level
	levelpointsneeded = atm_points_needed
	with(obj_bombcontrol)
	{
	TurnsToSpawn = other.Bomb_atm_TurnsToSpawn
	TurnsToSpawnCur = other.Bomb_atm_TurnsToSpawnCur
	BombCounter = other.Bomb_atm_BombCounter
	ExaggerateOnce = other.atm_exaggerate_once
	}
	with(obj_lock_control) 
	{
		TurnsToSpawn = other.Lock_atm_TurnsToSpawn
		TurnsToSpawnCur = other.Lock_atm_TurnsToSpawnCur
	}
	with(obj_doom_control)
	{
		DoomAlreadySpawnedOnce = other.Doom_atm_DoomAlreadySpawnedOnce 
		DoomCounter = other.Doom_atm_DoomCounter 
	}
	bomb_danger = Replay_map[? "bomb_danger"]
	bomb_win = Replay_map[? "bomb_win"]
}

with(obj_xplier)
{
	fill_to_go = Gamerule_1.atm_filltogo
	def_filler = Gamerule_1.atm_fill
	xplier_real = Gamerule_1.atm_xplier_real
	alarm[0] = 1
	var multiplier = Gamerule_1.xplier
	if xplier_real = 11 sprite_index = spr_xplier_flow_rainbow
	else sprite_index = spr_xplier_flow
	if multiplier <= 4
	{
		bar_gap = (64/multiplier)
		bar_sprite = multiplier - 1
	}
	else
	{
		bar_gap = 16 //16 pixels per gap
		bar_sprite = 3 //1 bars
	}
}
with(obj_levelbar) previous_points = Gamerule_1.atm_pre_points

//instance_deactivate_object(spawner1)
for(i=0;i<8;i++)
{
	for(j=0;j<8;j++)
	{
		var key = string(i) + "-" + string(j)
		if Gamerule_1.Replay_map[? key + "skin"] != -1
		{
			var gem = instance_create_depth(Board_1.x + j*64 , Board_1.y + i*64,-1 ,Gem_1)
			with(gem)
			{
				_i = floor((y-Board_1.y+63)/64)
				_j = (x-Board_1.x+63) div 64
				
				set_skin(Gamerule_1.Replay_map[? key + "skin"])
				amInvisible = Gamerule_1.Replay_map[? key + "amInv"]
				gempower = Gamerule_1.Replay_map[? key + "power"]
				amHype = Gamerule_1.Replay_map[? key + "amHype"]
				if amHype skinnum = 7
				amLocked = Gamerule_1.Replay_map[? key + "amLocked"]
				amBeingLocked = Gamerule_1.Replay_map[? key + "amBeingLocked"]
				amBomb = Gamerule_1.Replay_map[? key + "amBomb"]
				if (amBomb) bombappear = true;
				countdown = Gamerule_1.Replay_map[? key + "countdown"]	
				geodenum_points = -1
				geodenum = Gamerule_1.Replay_map[? key + "geodenum"]
				if amInvisible ds_list_add(Gamerule_1.list_of_hiddengems,id)
				for(var K = 1; K<=geodenum;K++)
				{
					geodenum_points[K-1] = Gamerule_1.Replay_map[? key + "geodenum_points"+string(K)]
				}

				if amBeingLocked = 1 && !amLocked
					{
						var app = instance_create(x,y,lockAppear)
						app.mygem = id
					}
				else if amBeingLocked = 2 && !amLocked
				{
					var app = instance_create(x,y,doomAppear)
					app.mygem = id
				}
				else if amBeingLocked = 3 && !amLocked
				{
					var app = instance_create(x,y,iceAppear)
					app.mygem = id
				}
				else if amBeingLocked = 1 && amLocked
				{
					var app = instance_create(x,y,lock_settling)
						app.mygem = id
				}
				else if amBeingLocked = 2 && amLocked
				{
					var app = instance_create(x,y,doom_settling)
						app.mygem = id
				}
				else if amBeingLocked = 3 && amLocked
				{
					var app = instance_create(x,y,ice_settling)
						app.mygem = id
				}
			
				if amLocked = 1 && skinnum != 7 ds_list_add(Gamerule_1.list_of_locks,id)
				else if amLocked = 3 ds_list_add(Gamerule_1.list_of_ice_locks,id)
				else if amLocked = 2
				{
					countdown--
					Gamerule_1.list_of_doom = id
				}
				else ds_list_add(Gamerule_1.list_of_coals,id)
			
				if amBomb ds_list_add(Gamerule_1.list_of_bombs,id)

			}
		}
	}
}
instance_destroy(obj_xplier_sperm,false)
instance_destroy(geode,false)
with(obj_bonus_challenge)
{
	perc = 0
	challenge_complete = false
	alarm[1] = -1
	alarm[2] = -1
	alarm[5] = -1
	sperm = Gamerule_1.Replay_map[? "bonus_sperm_count"]
	challenge_complete = Gamerule_1.Replay_map[? "challenge_complete"]
	if sperm > 0 || challenge_complete
	{
		alarm[5] = 1
		with(obj_bonus_doors) {image_speed = 0; image_index = image_number - 1}
	}
	else {with(obj_bonus_doors) {image_speed = 0; image_index = 0}}	
	//if challenge_complete alarm[5] = 1
	bonus_index = Gamerule_1.Replay_map[? "bonus_index"]
	bonus[0] = Gamerule_1.Replay_map[? "bonus0"]
	bonus[1] = Gamerule_1.Replay_map[? "bonus1"]
	bonus[2] = Gamerule_1.Replay_map[? "bonus2"]
	bonus[3] = Gamerule_1.Replay_map[? "bonus3"]
	future_bonus[0] = Gamerule_1.Replay_map[? "future_bonus0"]
	future_bonus[1] = Gamerule_1.Replay_map[? "future_bonus1"]
	future_bonus[2] = Gamerule_1.Replay_map[? "future_bonus2"]
	future_bonus[3] = Gamerule_1.Replay_map[? "future_bonus3"]
	indicator_x = x + bonus_index*64
}
with(player1)
{
	shouldinvert = Gamerule_1.Replay_map[? "shouldinvert"]
	xlim = Gamerule_1.Replay_map[? "x2"]
	ylim = Gamerule_1.Replay_map[? "y2"]
	xlimprevious = Gamerule_1.Replay_map[? "x1"]
	ylimprevious = Gamerule_1.Replay_map[? "y1"]
	x = Board_1.x + 64*xlim -32
	y = Board_1.y + 64*ylim -32
	var gem_move1 = instance_position(Board_1.x + 64*xlimprevious, Board_1.y + 64*ylimprevious, Gem_1)
	var gem_move2 = instance_position(Board_1.x + 64*xlim, Board_1.y + 64*ylim, Gem_1)
	
	if shouldinvert
	{
		var temp = gem_move1.x
		gem_move1.x = gem_move2.x
		gem_move2.x = temp
		var temp = gem_move1.y
		gem_move1.y = gem_move2.y
		gem_move2.y = temp
	}
	
	gem1 = gem_move1
	gem2 = gem_move2
	do_match(Gamerule_1)
}
instance_create(x,y,spawner_replay)
}
}
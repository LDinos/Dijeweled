///do_match(GAMERULE_INDEX)
function do_match(argument0) {
	// @param Gamerule
	//Do the match animation, and set that gamerule to gemactive0
	var saveagain = false
	var modifier = 1
	if Gamerule_1.isReplay modifier = 2
	instance_destroy(replay)
	if argument0.illegals_allowed
	{
	with(obj_avalanchedeposit) ammoving = true
	with(obj_avalanchedeposit_local) ammoving = true
	}
	if Gamerule_1.isQuest with(obj_quest_control) {event_user(0); event_user(3)}
	with(obj_makezenbkg) {alarm[0] = -1; if hidden unhide_items()}
	with(argument0) 
	{
		combo = 0
		if !isReplay Moves_Made++
		if !isReplay && replay_allowed
		{
			ds_map_delete(Replay_map,"Fruit_Spawn")
			ds_map_delete(Replay_map,"NEWLEVELSPAWN")
		}
		juststarted = false; 
		gemdestroyonemove =0;
		if !argument0.isReplay
		{
			swap_happened = true
			alarm[9] = 1 
		}
		reset_compliments()
	}

	if (!gem1.amHype && !gem2.amHype) || argument0.zenify || argument0.replay_illegals_allowed //hypercubes act like normal gems in zenify
	{
		dont_swap = true
		argument0.moving = true
		var list_of_bombs = argument0.list_of_bombs
		var list_of_skulls = argument0.list_of_skulls
		for(i=0;i<ds_list_size(list_of_bombs);i++)
		{
			with(list_of_bombs[| i])
			{
				countdown_decrease()
			}
		}
		for(i=0;i<ds_list_size(list_of_skulls);i++)
		{
			with(list_of_skulls[| i])
			{
				countdown_decrease()
			}
		}
		//check_baddies()

		if (argument0 == Gamerule_1) myid = Gem_1
		ammoving = true	
		if global.online
		{
			var idtosend1 = gem1.myid
			var idtosend2 = gem2.myid
			with(global.mynet)
			{
				buffer_seek(buffer,buffer_seek_start,0)
				buffer_write(buffer,buffer_u8,NN_MATCH_GEM_SWAP)
				buffer_write(buffer,buffer_u8,idtosend1)
				buffer_write(buffer,buffer_u8,idtosend2)
				network_send_packet(client_socket,buffer,buffer_tell(buffer))
			}
		}
		with(gem1)
		{
			iprev = _i
			jprev = _j
			skinprev = skinnum
			//myfriend = collision_point(x,y-64,other.myid,false,true)
			//with(myfriend) matchnear = true
		}
		with(gem2)
		{
			iprev = _i
			jprev = _j
			skinprev = skinnum
			//myfriend = collision_point(x,y-64,other.myid,false,true)
			//with(myfriend) matchnear = true
		}

		percent = 0
		xx = gem1.x
		yy = gem1.y
		xx2 = gem2.x
		yy2 = gem2.y
		argument0.cursor_x1 = xlimprevious
		argument0.cursor_x2 = xlim
		argument0.cursor_y1 = ylimprevious
		argument0.cursor_y2 = ylim

		gemtomove1 = gem1
		gemtomove2 = gem2
		gem1 = noone
		gem2 = noone
		argument0.moving = true
		with(gemtomove1) {isturnback = false; ammoving = true; SWAP_X_END = other.gemtomove2.x - x; SWAP_Y_END = other.gemtomove2.y - y; alarm[5] = 1}
		with(gemtomove2) {isturnback = false; ammoving = true; SWAP_X_END = other.gemtomove1.x - x; SWAP_Y_END = other.gemtomove1.y - y; alarm[5] = 1}

	}
	else //if one is at least hype
	{
		if !argument0.illegals_allowed
		{
			with(obj_avalanchedeposit) ammoving = true //hypercube bug fix, count my turn
			with(obj_avalanchedeposit_local) ammoving = true
		}
		with(obj_countdown_controller) moves--
		if argument0.isQuest
		{
			with(obj_quest_control)
			{
				if (C_movesneeded != S_movesdone) S_movesdone++
				if L_movesleft > 0 L_movesleft--
			}
		}

		if !argument0.isReplay && argument0.replay_allowed
		{
		with(argument0) {isReplayChecked = false; ds_map_clear(Replay_map); replay_savepoint()}
		}
		saveagain = true;
		gemtomove1 = gem1
		gemtomove2 = gem2
		xx = gem1.x
		yy = gem1.y
		xx2 = gem2.x
		yy2 = gem2.y
		argument0.moving = true
		argument0.IsGemActive = 0
		argument0.cursor_x1 = xlimprevious
		argument0.cursor_x2 = xlim
		argument0.cursor_y1 = ylimprevious
		argument0.cursor_y2 = ylim
	
		if gem1.amHype && gem2.amHype
		{
			var spawner = spawner1
			if (argument0 == Gamerule_local) spawner = spawner_local
			if !argument0.isReplay create_dualhype_newspawn(spawner)
			gem1.gem_to_hype = gem2
			gem1.skin_to_hype = 8
			gem2.gem_to_hype = gem1
			gem2.skin_to_hype = 8
			instance_destroy(gem2)
			instance_destroy(gem1)
		}
		else if gem1.amHype
		{
			gem1.gem_to_hype = gem2
			gem1.skin_to_hype = gem2.skinnum
			instance_destroy(gem1)
		}
		else
		{
			gem2.gem_to_hype = gem1
			gem2.skin_to_hype = gem1.skinnum
			instance_destroy(gem2)
		}
		gem1 = noone
		gem2 = noone
		argument0.combo = 1
	}

	if !argument0.isReplay && argument0.replay_allowed
	{
		with(argument0)
		{
			with(obj_bombcontrol) other.atm_exaggerate_once = ExaggerateOnce
			if !saveagain 
			{
				ds_map_clear(Replay_map)
				isReplayChecked = false //dont set it to false if we made a hypercube match			
				ds_map_add(Replay_map, "shouldinvert",true)
			}
			else
			{
				ds_map_add(Replay_map, "shouldinvert",false)
			}
		
			if instance_exists(obj_background_shadered)
			{
				ds_map_delete(argument0.Replay_map, "background_nextlevel")
				ds_map_add(Replay_map, "background", obj_background_shadered.shd)
			}
			ds_map_add(Replay_map, "x1",other.xlimprevious)
			ds_map_add(Replay_map, "y1",other.ylimprevious)
			ds_map_add(Replay_map, "x2",other.xlim)
			ds_map_add(Replay_map, "y2",other.ylim)
			if zenify ds_map_add(Replay_map, "illegals_allowed",illegals_allowed)
			ds_map_add(Replay_map, "bomb_danger",bomb_danger)
			ds_map_add(Replay_map, "bomb_win",bomb_win)
			atm_level = level
			atm_xplier = xplier
			if instance_exists(obj_xplier)
			{
			atm_fill = obj_xplier.def_filler
			atm_filltogo = obj_xplier.fill_to_go
			atm_xplier_real = obj_xplier.xplier_real
			}
			if instance_exists(obj_bonus_challenge)
			{
				ds_map_add(Replay_map, "bonus0", obj_bonus_challenge.bonus[0])
				ds_map_add(Replay_map, "bonus1", obj_bonus_challenge.bonus[1])
				ds_map_add(Replay_map, "bonus2", obj_bonus_challenge.bonus[2])
				ds_map_add(Replay_map, "bonus3", obj_bonus_challenge.bonus[3])
				ds_map_add(Replay_map, "future_bonus0", obj_bonus_challenge.future_bonus[0])
				ds_map_add(Replay_map, "future_bonus1", obj_bonus_challenge.future_bonus[1])
				ds_map_add(Replay_map, "future_bonus2", obj_bonus_challenge.future_bonus[2])
				ds_map_add(Replay_map, "future_bonus3", obj_bonus_challenge.future_bonus[3])
				ds_map_add(Replay_map, "bonus_index", obj_bonus_challenge.bonus_index)
				ds_map_add(Replay_map, "challenge_complete", obj_bonus_challenge.challenge_complete)
				ds_map_add(Replay_map, "bonus_sperm_count", obj_bonus_challenge.sperm - obj_bonus_challenge.sperm_travelling)
			}
		
		}
	}


}

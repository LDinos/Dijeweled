/// @function swap_gems(gem1,gem2)
/// @description Initialize swap variables and trigger gem alarm events
/// @param {gem_id} gem1 first gem
/// @param {gem_id} gem2 second gem
function swap_gems(gem1,gem2, check_for_swap_back) {
	if ((gem1.amHype || gem2.amHype) && !MyGamerule.IsGemActive2) return 0;
	if (gem1.amHype && gem2.amInvisible) ||  (gem2.amHype && gem1.amInvisible) {
		with(gem1) unspin()
		other.gem1 = noone
		other.gem2 = noone
		return 0;
	}
	xlimprevious = gem1._j
	ylimprevious = gem1.i_limit
	xlim = gem2._j
	ylim = gem2.i_limit
	var x1 = xlimprevious; var x2 = xlim; var y1 = ylimprevious; var y2 = ylim
	if (!Gamerule_1.isReplay && Gamerule_1.replay_allowed) { 
		with(Gamerule_1)
		{
			with(obj_bombcontrol) other.atm_exaggerate_once = ExaggerateOnce
			ds_map_clear(Replay_map)
			isReplayChecked = false //dont set it to false if we made a hypercube match	
			replay_savepoint()
			if instance_exists(obj_background_shadered)
			{
				ds_map_delete(Replay_map, "background_nextlevel")
				ds_map_add(Replay_map, "background", obj_background_shadered.shd)
			}
			ds_map_add(Replay_map, "x1",x1)
			ds_map_add(Replay_map, "y1",y1)
			ds_map_add(Replay_map, "x2",x2)
			ds_map_add(Replay_map, "y2",y2)
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
	swap_back = check_for_swap_back
	instance_destroy(replay) //Destroy replay button
	if Gamerule_1.isQuest with(obj_quest_control) {event_user(0); event_user(3)} //Quest UNDO checkpoint and Lonemove reset
	with(obj_makezenbkg) {alarm[0] = -1; if (hidden) unhide_items()}
	with(MyGamerule) {
		moving = true
		combo = 0
		juststarted = false
		gemdestroyonemove = 0
		reset_compliments()
		swap_happened = true
		alarm[9] = 1
	}
	with(Gamerule_1) {
		if (!isReplay) {
			Moves_Made++
			if (replay_allowed) {
				ds_map_delete(Replay_map,"Fruit_Spawn")
				ds_map_delete(Replay_map,"NEWLEVELSPAWN")
			}
		}
	}
	
	with(gem1) {unspin(); iprev = _i; jprev = _j; skinprev = skinnum; ammoving = true;}
	with(gem2) {iprev = _i; jprev = _j; skinprev = skinnum; ammoving = true;}
	gemtomove1 = gem1
	gemtomove2 = gem2
	percent = 0
	gem1.SWAP_X_END = gem2.x - gem1.x
	gem2.SWAP_X_END = gem1.x - gem2.x
	gem1.SWAP_Y_END = gem2.y - gem1.y
	gem2.SWAP_Y_END = gem1.y - gem2.y
	id.gem1 = noone //dont confuse this with temp variables gem1,2
	id.gem2 = noone
	MyGamerule.cursor_x1 = xlimprevious
	MyGamerule.cursor_x2 = xlim
	MyGamerule.cursor_y1 = ylimprevious
	MyGamerule.cursor_y2 = ylim
	var gems_will_swap = (!gem1.amHype && !gem2.amHype) || Gamerule_1.zenify || Gamerule_1.replay_illegals_allowed 
	if (gems_will_swap) //this is when gems will swap (unlike the condition where there are hypercubes)
	{
		change_gem_pos_vars(gem1, gem2, gem2._i, gem2._j, gem1._i, gem1._j)
		alarm[1] = 1 //swap anim
		swap_back = false
		var list_of_bombs = Gamerule_1.list_of_bombs
		var list_of_skulls = Gamerule_1.list_of_skulls
		for(var i=0;i<ds_list_size(list_of_bombs);i++) {
			with(list_of_bombs[| i])
			{
				countdown_decrease()
			}
		}
		for(var i=0;i<ds_list_size(list_of_skulls);i++) {
			with(list_of_skulls[| i])
			{
				countdown_decrease()
			}
		}
		if global.online {
			var idtosend1 = gem1.myid
			var idtosend2 = gem2.myid
			with(global.mynet) {
				buffer_seek(buffer,buffer_seek_start,0)
				buffer_write(buffer,buffer_u8,NN_MATCH_GEM_SWAP)
				buffer_write(buffer,buffer_u8,idtosend1)
				buffer_write(buffer,buffer_u8,idtosend2)
				network_send_packet(client_socket,buffer,buffer_tell(buffer))
			}
		}
	}
	else { //if we have at least one hypercube
		if !MyGamerule.illegals_allowed
		{
			with(obj_avalanchedeposit) ammoving = true //hypercube bug fix, count my turn
			with(obj_avalanchedeposit_local) ammoving = true
		}
		with(obj_countdown_controller) moves--
		if (!Gamerule_1.isQuest) {
			with(obj_quest_control) {
				if (C_movesneeded != S_movesdone) S_movesdone++
				if L_movesleft > 0 L_movesleft--
			}
		}
		if !Gamerule_1.isReplay && Gamerule_1.replay_allowed {
			with(Gamerule_1) {isReplayChecked = false; ds_map_clear(Replay_map);}
		}
		gem1.gem_to_hype = gem2
		gem1.skin_to_hype = gem2.skinnum
		gem2.gem_to_hype = gem1
		gem2.skin_to_hype = gem1.skinnum
		if (gem1.amHype && gem2.amHype) {
			Gamerule_1.spawn_hype = true
			gem1.skin_to_hype = 8
			gem2.skin_to_hype = 8
		}
		if gem1.amHype instance_destroy(gem1)
		else if gem2.amHype instance_destroy(gem2)
		MyGamerule.combo = 1
	}
	
	if match_replay
	{
		ds_map_add(MyGamerule.Replay_match_map,string(MyGamerule.cur_time),MyGamerule.cur_time)
		var key = "gamepad" + string(MyGamerule.cur_time)
		ds_map_add(MyGamerule.Replay_match_map,key,false)
		var key = "xlim_previous" + string(MyGamerule.cur_time)
		ds_map_add(MyGamerule.Replay_match_map,key,xlimprevious)
		key = "ylim_previous" + string(MyGamerule.cur_time)
		ds_map_add(MyGamerule.Replay_match_map,key,ylimprevious)
		key = "xlim_" + string(MyGamerule.cur_time)
		ds_map_add(MyGamerule.Replay_match_map,key,xlim)
		key = "ylim_" + string(MyGamerule.cur_time)
		ds_map_add(MyGamerule.Replay_match_map,key,ylim)
	}
}

function swap_gems_back() {
	// @param Gamerule
	//Do the match animation (again but in reverse), and set that gamerule to gemactive0
	var gem1 = gemtomove1
	var gem2 = gemtomove2
	currently_swapping_back = true
	alarm[7] = -1
	Gamerule_1.replay_illegals_allowed = false
	if global.online
		{
			var idtosend1 = gemtomove1.myid
			var idtosend2 = gemtomove2.myid
			with(global.mynet)
			{
				buffer_seek(buffer,buffer_seek_start,0)
				buffer_write(buffer,buffer_u8,NN_MATCH_GEM_SWAP)
				buffer_write(buffer,buffer_u8,idtosend1)
				buffer_write(buffer,buffer_u8,idtosend2)
				network_send_packet(client_socket,buffer,buffer_tell(buffer))
			}
		}
	ammoving = true
	percent = 0
	var xx = gem1.x
	var yy = gem1.y
	var xx2 = gem2.x
	var yy2 = gem2.y
	var i1 = gem1.i_limit
	var i2 = gem2.i_limit
	with(gem1) {ammoving = true; SWAP_X_END = xx2 - x; SWAP_Y_END = yy2 - y; i_limit = i2}
	with(gem2) {ammoving = true; SWAP_X_END = xx - x; SWAP_Y_END = yy - y; i_limit = i1}
	change_gem_pos_vars(gem1, gem2, gem2._i, gem2._j, gem1._i, gem1._j)
	alarm[1] = 1

}
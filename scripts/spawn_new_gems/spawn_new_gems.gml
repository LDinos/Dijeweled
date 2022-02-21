/// @function spawn_new_gems(board,gemid)
/// @description Spawn a batch of new gems
/// @param {object} board Board id
/// @param {object} gemid Gem id
function spawn_new_gems(board, gemid) {
	var special_array = ds_list_create() //If we need to spawn bombs/coals etc, take a random spawned gem
	for(var j = 0; j < 8; j++) {
		//var gap = gaps[j]
		var i_spawn = 0
		for(var i = 7; i >= 0; i--) {
			if gems_to_spawn[i][j] != -1 {
				var _x = board.x + j*64
				var _y = 512 - 32 - 64*(i_spawn)
				i_spawn++
				var gem = instance_create_depth(_x,_y, -1, gemid)	
				gem.i_limit = i
				gems_id_array[i][j] = gem
				gems_skin_array[i][j] = gem.skinnum
				var strct = { "GEM" : gem, "J" : j}
				ds_list_add(special_array, strct)
			}
		}
	}
	ds_list_shuffle(special_array)
	while (spawn_bomb || spawn_coal || spawn_hype) && !ds_list_empty(special_array) {
		var strct = special_array[| 0]
		var g = strct[$ "GEM"]
		var j = strct[$ "J"]
		if (spawn_bomb) {
			g.amBomb = true
			g.countdown = obj_bombcontrol.BombCounter
			ds_list_add(list_of_bombs,g)
			make_infobox(FirstTime_Bomb,2)
			ds_list_delete(special_array, 0)
			spawn_bomb = false
		}
		else if (spawn_coal) {
			with(g) set_skin(7)
			make_infobox(FirstTime_Coal,5)
			ds_list_add(list_of_coals,g)
			ds_list_delete(special_array, 0)
			spawn_coal = false
		}
		else if (spawn_hype) {
			var g2 = special_array[| 1]
			with(g) set_skin(7)
			g.amHype = true
			with(g2) set_skin(7)
			g2.amHype = true
			ds_list_delete(special_array, 0)
			ds_list_delete(special_array, 1)
			spawn_hype = false
		}
		replay_store_gem(g, j)
	}
	for(var i = 0; i < ds_list_size(special_array); i++) {
		var strct = special_array[| i]
		var g = strct[$ "GEM"]
		var j = strct[$ "J"]
		replay_store_gem(g, j)
	}
	ds_list_destroy(special_array)
}

function replay_store_gem(gem, j) {
	with(Gamerule_1)
	{
		if replay_allowed & !juststarted
		{
			var key = string(up_index[j]+8)+"-"+string(j)			
			ds_map_set(Replay_map, key + "amHype",gem.amHype)
			ds_map_set(Replay_map, key + "skin",gem.skinnum)
			ds_map_set(Replay_map, key + "power",0)
			ds_map_set(Replay_map, key + "amLocked",0)
			ds_map_set(Replay_map, key + "amBeingLocked",0)
			ds_map_set(Replay_map, key + "amBomb",gem.amBomb)
			ds_map_set(Replay_map, key + "countdown",gem.countdown)
			ds_map_set(Replay_map,key + "geodenum",gem.geodenum)
			for(var K = 0; K<gem.geodenum;K++)
			{
				ds_map_set(Replay_map,key + "geodenum_points"+string(K),gem.geodenum_points[K])
			}
			up_index[j]++
		}
	}
}
/// @function spawn_new_gems(board,gemid)
/// @description Spawn a batch of new gems
/// @param {object} board Board id
/// @param {object} gemid Gem id
function spawn_new_gems(board, gemid) {
	if (!spawnallowed) return 0;
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
				if (Gamerule_1.isReplay) set_gem_replay_properties(gem)
				else {
					var strct = { "GEM" : gem, "J" : j, "up_index" : up_index[j]}
					up_index[j]++
					ds_list_add(special_array, strct)
				}
				gems_id_fallen_array[i][j] = gem
				gems_skin_array[i][j] = gem.skinnum
			}
		}
	}
	if !(Gamerule_1.isReplay) {
		ds_list_shuffle(special_array)
		while (spawn_bomb || spawn_coal || spawn_hype) && !ds_list_empty(special_array) {
			var strct = special_array[| 0]
			var g = strct[$ "GEM"]
			var j = strct[$ "J"]
			var u = strct[$ "up_index"]
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
				var g2 = special_array[| 1][$ "GEM"]
				with(g) set_skin(7)
				g.amHype = true
				with(g2) set_skin(7)
				g2.amHype = true
				ds_list_delete(special_array, 0)
				ds_list_delete(special_array, 1)
				spawn_hype = false
			}
			replay_store_gem(g, j, u)
		}
		for(var i = 0; i < ds_list_size(special_array); i++) {
			var strct = special_array[| i]
			var g = strct[$ "GEM"]
			var j = strct[$ "J"]
			var u = strct[$ "up_index"]
			replay_store_gem(g, j, u)
		}
	}
	ds_list_destroy(special_array)
	
}

function replay_store_gem(gem, j, u) {
	with(Gamerule_1)
	{
		if replay_allowed & !juststarted
		{
			var key = string(u+8)+"-"+string(j)
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
		}
	}
}

function set_gem_replay_properties(gem) {
	var _J = gem._j
	var key = string(up_index[_J]+8) + "-" + string(_J)
	with(gem) {
		set_skin(Gamerule_1.Replay_map[? key + "skin"])
		gempower = Gamerule_1.Replay_map[? key + "power"]
		amLocked = Gamerule_1.Replay_map[? key + "amLocked"]
		amBeingLocked = Gamerule_1.Replay_map[? key + "amBeingLocked"]
		amBomb = Gamerule_1.Replay_map[? key + "amBomb"]
		countdown = Gamerule_1.Replay_map[? key + "countdown"]
		amHype = Gamerule_1.Replay_map[? key + "amHype"]
		geodenum = Gamerule_1.Replay_map[? key + "geodenum"]
		for(var K = 0; K<geodenum;K++)
		{
			geodenum_points[K] = Gamerule_1.Replay_map[? key + "geodenum_points"+string(K)]
		}
		if (amBomb) ds_list_add(Gamerule_1.list_of_bombs,id)
	}
	up_index[_J]++
}
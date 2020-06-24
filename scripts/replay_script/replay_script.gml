///@param j
///@param gem
///@param increase_index
///@description Replay script used when we need to store gems that did not spawn from the spawner itself
// for example, AHM. You provide the j'th index, the gem to be stored and if that gem already exists, tell me not
// to increase the up_index (aka just CHANGE a already existing storage)
with(Gamerule_1)
{
	if replay_allowed
	{
		var _J = argument0
		var key = string(up_index[_J]+8)+"-"+string(_J)
		var gemtouse = argument1						
		ds_map_set(Replay_map, key + "skin",gemtouse.skinnum)
		ds_map_set(Replay_map, key + "power",0)
		ds_map_set(Replay_map, key + "amLocked",0)
		ds_map_set(Replay_map, key + "amBeingLocked",0)
		ds_map_set(Replay_map, key + "amBomb",gemtouse.amBomb)
		ds_map_set(Replay_map, key + "countdown",gemtouse.countdown)
		ds_map_add(Replay_map, key + "geodenum",gemtouse.geodenum)
		ds_map_add(Replay_map, key + "amHype",gemtouse.amHype)
		for(var K = 1; K<=gemtouse.geodenum;K++)
		{
			ds_map_add(Replay_map,key + "geodenum_points"+string(K),gemtouse.geodenum_points[K-1])
		}
		if argument2 up_index[_J]++
	}
}

if global.replay_match_allowed
	{
		var _J = argument0
		var key = string(7+match_up_index[_J])+"-"+string(_J)
		var gemtouse = argument1
		ds_map_add(Gamerule_1.Replay_match_map,key + "_spawn",gemtouse.skinnum)
		if argument2 match_up_index[_J]++
	}
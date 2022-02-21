/// @description Spawn fruit
	Gamerule_1.fruit_want_to_spawn = false
	Gamerule_1.fruit_spawning = true
	sprite_index = spr_xplier_flow
	
	var gem_to_spawn = noone;
	var is_list_empty = false;
if !global.replay_match_isplaying
{
	if !ds_map_exists(Gamerule_1.Replay_map,"Fruit_Pos") || !Gamerule_1.replay_allowed //if we dont have replays
	{
		#region Spawn fruit on good position	
/*1*/	if !ds_list_empty(Gamerule_1.list_of_bombs) //first look if we have bombs to destroy
			{
				gem_to_spawn = Gamerule_1.list_of_bombs[| 0]
				var best = 0
				for(var i=1;i<ds_list_size(Gamerule_1.list_of_bombs);i++)
				{
					if (Gamerule_1.list_of_bombs[| i].countdown < Gamerule_1.list_of_bombs[| best].countdown)
					{
						gem_to_spawn = Gamerule_1.list_of_bombs[| i]
						best = i
					}
				}
			}
/*2*/	else if !ds_list_empty(Gamerule_1.list_of_locks)
		{
			gem_to_spawn = Gamerule_1.list_of_locks[| 0]			
		}
/*3*/	else //else find a random gem to spawn
		{
			var wheretospawn = ds_list_create()
			for(i=0;i<8;i++)
			{
				for(var j=0;j<8;j++)
				{
					if (Gamerule_1.gems_id_array[i][j].skinnum != 7) && (Gamerule_1.gems_id_array[i][j].gempower = 0)
					{
						ds_list_add(wheretospawn,Gamerule_1.gems_id_array[i][j])
					}
				}
			}
			if ds_list_size(wheretospawn) > 0
			{
				ds_list_shuffle(wheretospawn)
				var q = 0
				do
				{
					gem_to_spawn = wheretospawn[| q] 
					q++
				}
				until gem_to_spawn != noone
			}
			else is_list_empty = true
			
			ds_list_destroy(wheretospawn)
		}
		
#endregion		
	}
	else
	{
		var _i = Gamerule_1.Replay_map[? "Fruit_i"]
		var _j = Gamerule_1.Replay_map[? "Fruit_j"]
		gem_to_spawn = instance_position(Board_1.x + 64*_j,Board_1.y + 64*_i,Gem_1)
	}
 
		if !is_list_empty //instance_exists(gem_to_spawn) //supposing everything went right
		{
			if global.replay_match_allowed
			{
				ds_map_add(Gamerule_1.Replay_match_map,"fruit_pos_i_" + string(sum_pos),gem_to_spawn._i)
				ds_map_add(Gamerule_1.Replay_match_map,"fruit_pos_j_" + string(sum_pos),gem_to_spawn._j)
				sum_pos++
			}
			ds_map_add(Gamerule_1.Replay_map,"Fruit_Pos",true)
			ds_map_add(Gamerule_1.Replay_map,"Fruit_i", gem_to_spawn._i)
			ds_map_add(Gamerule_1.Replay_map,"Fruit_j", gem_to_spawn._j)
			var sp = instance_create(x,y,obj_fruit_spawner)
			sp.image_index = gem_to_spawn.skinnum
			sp.gotox = gem_to_spawn.x
			sp.gotoy = gem_to_spawn.y
			sp.gotoobject = gem_to_spawn
			//image_speed = 1
			lerpy_speed = 1
		}
		else //else just dont spawn the fruit
		{
			Gamerule_1.fruit_spawning = false
			//image_speed = 1
			lerpy_speed = 1
		}
}
else //if we are viewing a replay
{
		var _i = Replay_load[? "fruit_pos_i_" + string(sum_pos)]
		var _j = Replay_load[? "fruit_pos_j_" + string(sum_pos)]
		sum_pos++
		gem_to_spawn = instance_position(Board_1.x + 64*_j,Board_1.y + 64*_i,Gem_1)
		var sp = instance_create(x,y,obj_fruit_spawner)
		sp.image_index = gem_to_spawn.skinnum
		sp.gotox = gem_to_spawn.x
		sp.gotoy = gem_to_spawn.y
		sp.gotoobject = gem_to_spawn
		//image_speed = 1
		lerpy_speed = 1
}
	

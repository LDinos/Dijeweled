/// @description Checkpoint for UNDO // movesleft
//if L_movesleft > 0 L_movesleft--
//S_movesdone++
if C_gemsare0 && !Gamerule_1.spawnallowed && !Gamerule_1.multiswap_allowed
{
	ini_open("CHK")
		var map = ds_map_create()
		ds_map_add(map,"bomb_win",Gamerule_1.bomb_win)
		ds_map_add(map,"bomb_danger",Gamerule_1.bomb_danger)
		if instance_exists(obj_xplier)
		{
			ds_map_add(map,"xplier_fill_to_go",obj_xplier.fill_to_go)
			ds_map_add(map,"xplier_def_filler",obj_xplier.def_filler)
			ds_map_add(map,"xplier_real",obj_xplier.xplier_real)
			ds_map_add(map,"xplier_bars",obj_xplier.bar_sprite)
			ds_map_add(map,"xplier",Gamerule_1.xplier)
		}
		if instance_exists(obj_bonus_challenge)
		{
			ds_map_add(map,"bonus_index",obj_bonus_challenge.bonus_index)
			ds_map_add(map,"bonus_sperm",obj_bonus_challenge.sperm)
			for(var i = 0; i < 4; i++)
			{
				ds_map_add(map,"bonus_"+string(i),obj_bonus_challenge.bonus[i])
				ds_map_add(map,"future_bonus_"+string(i),obj_bonus_challenge.future_bonus[i])
			}
		}
			for(var i = 0; i < 8; i++)
			{
				for(var j = 0; j < 8; j++)
				{
					var str = string(i)+string(j)
					var skin = Gamerule_1.gemboard[i,j]
					ds_map_add(map,str+"skin",skin)
					if skin >= 0
					{
						var gem_power = Gamerule_1.gem_board1[i,j].gempower
						var amlocked = Gamerule_1.gem_board1[i,j].amLocked
						var ambeinglocked = Gamerule_1.gem_board1[i,j].amBeingLocked
						var ambomb = Gamerule_1.gem_board1[i,j].amBomb
						var count_down = Gamerule_1.gem_board1[i,j].countdown
						var amhype = Gamerule_1.gem_board1[i,j].amHype
						var geode_num = Gamerule_1.gem_board1[i,j].geodenum
						var am_inv = Gamerule_1.gem_board1[i,j].amInvisible
						
						//now lets write it
						ds_map_add(map,str+"geodenum",geode_num)
						for(var K=1; K<=geode_num;K++)
						{
							ds_map_add(map,str+"geodenum_points" + string(K), Gamerule_1.gem_board1[i,j].geodenum_points[K-1])
						}
						ds_map_add(map,str+"gempower",gem_power)
						ds_map_add(map,str+"amLocked",amlocked)
						ds_map_add(map,str+"amBeingLocked",ambeinglocked)
						ds_map_add(map,str+"amBomb",ambomb)
						ds_map_add(map,str+"countdown",count_down)
						ds_map_add(map,str+"amHype",amhype)
						ds_map_add(map,str+"amInvisible",am_inv)
						
					}
				}
			}
		var data = ds_map_write(map)
		ini_write_string("Data",string(checkpoint),data) 
		ds_map_destroy(map)
	ini_close()
	
	checkpoint++
}
/// @description UNDO trigger
// You can write your code in this editor
if checkpoint > 0
{
	if C_movesneeded != -1 S_movesdone--
	instance_destroy(Gem_1,false)
	instance_destroy(lightningObj1,false)
	instance_destroy(lightningkiller,false)
	instance_destroy(Coal_break,false)
	instance_destroy(geode,false)
	instance_destroy(geode_text,false)
	instance_destroy(obj_fruit_spawner,false)
	instance_destroy(obj_xplier_sperm,false)
	Gamerule_1.lightOn = false
	with(player1) {gem1 = noone; gem2 = noone}
	ini_open("CHK")
		var map = ds_map_create()
		var data = ini_read_string("Data",string(checkpoint-1),"")
		
		if (data == "") room_restart()
		else
		{
			ds_map_read(map,data)
			Gamerule_1.bomb_win = map[? "bonus_win"]
			Gamerule_1.bomb_danger = map[? "bonus_danger"]
			S_destroyed_locks = map[? "S_destroyed_locks"]
			S_destroyed_bombs = map[? "S_destroyed_bombs"]
			S_destroyed_dooms = map[? "S_destroyed_dooms"]
			S_destroyed_ice = map[? "S_destroyed_ice"]
			S_destroyed_flames = map[? "S_destroyed_flames"]
			S_destroyed_lights = map[? "S_destroyed_lights"]
			S_destroyed_novas = map[? "S_destroyed_novas"]
			S_destroyed_septas = map[? "S_destroyed_septas"]
			S_destroyed_octas = map[? "S_destroyed_octas"]
			S_destroyed_hypes = map[? "S_destroyed_hypes"]
			S_destroyed_coals = map[? "S_destroyed_coals"]
			S_destroyed_skulls = map[? "S_destroyed_skulls"]
			S_destroyed_fruits = map[? "S_destroyed_fruits"]
			S_destroyed_gems = map[? "S_destroyed_gems"]
			S_matched_gems = map[? "S_matched_gems"]
			S_num_flames = map[? "S_num_flames"]
			S_num_lights = map[? "S_num_lights"]
			S_num_novas = map[? "S_num_novas"]
			S_num_septas = map[? "S_num_septas"]
			S_num_octas = map[? "S_num_octas"]
			S_num_hypes = map[? "S_num_hypes"]
			S_num_coals = map[? "S_num_coals"]
			S_num_zenifycombo = map[? "S_num_zenifycombo"]
			S_num_red = map[? "S_num_red"]
			S_num_green = map[? "S_num_green"]
			S_num_orange = map[? "S_num_orange"]
			S_num_blue = map[? "S_num_blue"]
			S_num_white = map[? "S_num_white"]
			S_num_yellow = map[? "S_num_yellow"]
			S_num_purple = map[? "S_num_purple"]
			S_num_fruits = map[? "S_num_fruits"]
			S_best_cascade = map[? "S_best_cascade"]
			S_gemcombo = map[? "S_gemcombo"]
			S_movesdone = map[? "S_movesdone"]

			if instance_exists(obj_bonus_challenge)
			{
				with(obj_bonus_challenge)
				{
					alarm[1] = -1
					alarm[2] = -1
					alarm[5] = -1
					sperm = map[? "bonus_sperm"]
					bonus_index = map[? "bonus_index"]
					for(var i = 0; i <4; i++)
					{
						bonus[i] = map[? "bonus_"+string(i)]
						future_bonus[i] = map[? "future_bonus_"+string(i)]
					}
					if sperm > 0
					{
						alarm[5] = 1
						with(obj_bonus_doors) {image_speed = 0; image_index = image_number - 1}
					}
					else {with(obj_bonus_doors) {image_speed = 0; image_index = 0}}	
					indicator_x = x + bonus_index*64
				}
			}
			if instance_exists(obj_xplier)
			{
				with(obj_xplier)
				{
					fill_to_go = map[? "xplier_fill_to_go"]
					def_filler = map[? "xplier_def_filler"]
					xplier_real = map[? "xplier_real"]
					bar_sprite = map [? "xplier_bars"]
					Gamerule_1.xplier = map[? "xplier"]
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
			}
			for(var i = 0; i<8; i++)
			{
				for(var j = 0; j<8; j++)
				{
					var str = string(i)+string(j)
					var skin = map[? str+"skin"]
					Gamerule_1.gemboard[i,j] = skin
					if skin >= 0
					{
					var GEM = instance_create(Board_1.x + j*64, Board_1.y + i*64,Gem_1)				
					with(GEM) set_skin(skin)				
					var gem_power = map[? str+"gempower"]
						var amlocked = map[? str+"amLocked"]
						var ambeinglocked = map[? str+"amBeingLocked"]
						var ambomb = map[? str+"amBomb"]
						var count_down = map[? str+"countdown"]
						var amhype = map[? str+"amHype"]
						var geode_num = map[? str+"geodenum"]
						var am_inv = map[? str+"amInvisible"]
						
						GEM.gempower = gem_power
						GEM.geodenum_points = -1
						GEM.geodenum = geode_num
						for(var K=1; K<=geode_num;K++)
						{
							GEM.geodenum_points[K-1] = map[? str+"geodenum_points" + string(K)]
						}
						GEM.amLocked = amlocked
						GEM.amBeingLocked = ambeinglocked
						GEM.amBomb = ambomb
						GEM.countdown = count_down
						GEM.amHype = amhype
						GEM.amInvisible = am_inv
						Gamerule_1.gem_board1[i,j] = GEM
					}
					else Gamerule_1.gem_board1[i,j] = noone
				}
			}
		}
		ds_map_destroy(map)
		ini_key_delete("Data",string(checkpoint))
	ini_close()
	checkpoint--
}
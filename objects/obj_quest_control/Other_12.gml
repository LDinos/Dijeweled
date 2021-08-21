/// @description RESET trigger
// You can write your code in this editor
if checkpoint > 0
{
	if C_movesneeded != -1 {S_movesdone = 0}
	instance_destroy(lightningObj1,false)
	instance_destroy(lightningkiller,false)
	instance_destroy(Coal_break,false)
	instance_destroy(geode,false)
	instance_destroy(geode_text,false)
	instance_destroy(obj_fruit_spawner,false)
	instance_destroy(obj_xplier_sperm,false)
	Gamerule_1.lightOn = false
	with(player1) {gem1 = noone; gem2 = noone}
	checkpoint = 0
	instance_destroy(Gem_1,false)
	ini_open("CHK")
		var map = ds_map_create()
		var data = ini_read_string("Data",string(checkpoint),"")
		
		if (data == "") room_restart()
		else
		{
			ds_map_read(map,data)
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
					sum_pos = 0 //number of fruit spawns, for match replay
					light = 0
					perc = 0 //percentage for lerp at flow width
					filler = 0 //current filler width
					def_filler = 0 //base filler width
					fill_to_go = 0 //future fill in lerp function
					bar_gap = 64 //the gap between each bar (gets smaller as the xplie increases)
					bar_sprite = 0 //number of bars to show
					xplier_index = 0 //number of gaps filled (for checking for fruit)
					xplier_real = 1 //real section for multiplier
					xx = x 
					perc = 0
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
						GEM.gempower = gem_power
						Gamerule_1.gem_board1[i,j] = GEM
					}
					else Gamerule_1.gem_board1[i,j] = noone
				}
			}
		}
		ds_map_destroy(map)
		ini_key_delete("Data",string(checkpoint))
	ini_close()
	
}
/// @description Insert description here
// You can write your code in this editor
if (Gamerule_1.isReplay || global.spectator) exit;
if (!Gamerule_1.spawnallowed || Gamerule_1.IsGemActive) exit;
if (Gamerule_1.fruit_exploding || Gamerule_1.hypeOn || Gamerule_1.lightOn || Gamerule_1.flameon) exit;

with(Gamerule_1) check_gaps(Board_1,Gem_1)
for(j=0;j<=7;j++) {
	
	if (Gamerule_1.gaps[j] <= 0) continue;
	if (collision_line( Board_1.x + j*64, Board_1.y-64, Board_1.x + j*64, Board_1.y+4, Gem_1, false, true) 
		|| position_meeting(Board_1.x + j*64, Board_1.y, gem_dissappear)) continue;

	with(Gamerule_1) check_summoves(false)
	Gem_create = noone
	if (spawn_specific) {
		Gem_create = instance_create_depth(Board_1.x + j*64,Board_1.y-64,-1,Gem_1)
		var key = string(specific[j]) + string(j)
		var skin = spawn_specific_array[? key + "_skin"]
		
		with(Gem_create) {
			set_skin(skin)
			if (Gamerule_1.ONLINE_give_gem_id) {
				scr_add_gemid(Gamerule_1)
				network_send(NN_MATCH_GEM_SPAWN, [buffer_u8, buffer_u8], [_j, skinnum])
			}
			amHype = other.spawn_specific_array[? key + "_amHype"]
			if (amHype) network_send(NN_MATCH_DUALHYPE_MAKE_HYPE, [buffer_u8], [myid])
			acctosend = take_other_vsp()
		}
		specific[j]++
		specific_count++
		if (specific_count = 64) {specific_count = 0; for(var K = 0; K <8; K++) {specific[K] = 0;} spawn_specific = false}			
	}
	else {
		//FOR COAL\\
		with(obj_coal_control) if (TurnsToSpawnRandom) decreaseSpawnCounter() //Only if randomized, activate event(0) here
		Gem_create = instance_create_depth(Board_1.x + j*64,Board_1.y-64,-1,Gem_1)
		idtosend1 = Gem_create.myid
		acctosend = 0
		with(Gem_create) //set same speed
			{
				#region Make gem special
				if other.bombspawn > -1
				{
					var o = irandom_range(1,100) //get a random number
					var g = check_total_gaps() //get the number of gaps
					if (g <= 0) g = 1 //just in case we dont divide by zero
					//show_message(string(o)+ "," + string(g))
					if o <= (1/g)*100 //dont always make a bomb at the very first gem spawn, instead choose randomly 
					{				//which one of the spawned gems will be a bomb, until the gaps are 0 (1/1 = 100)
						//Spawn bomb
						other.bombspawn = -1
						amBomb = true
						countdown = obj_bombcontrol.BombCounter
						ds_list_add(Gamerule_1.list_of_bombs,id)
					}
				}
				else if other.coalspawn
				{
					image_index = 7
					skinnum = 7
					make_infobox(Gamerule_1.FirstTime_Coal,5)
					ds_list_add(Gamerule_1.list_of_coals,id)
				}
				else if other.powerupspawn
				{
					other.powerupspawn = false
					mypowerup = irandom_range(0,6)
					audio_play_sound(snd_powerupappear,0,0)
				}
				#endregion
							
				#region online
				if Gamerule_1.ONLINE_give_gem_id
				{
					scr_add_gemid(Gamerule_1)
					network_send(NN_MATCH_GEM_SPAWN, [buffer_u8,buffer_u8], [_j,skinnum])
				}
				#endregion
				
				acctosend = take_other_vsp()
			}
					
		if (Gamerule_1.summoves2 = 0 && !havedone && Gamerule_1.AHM_allowed)// && !Gamerule_1.juststarted
			{
				spawn_script(Gamerule_1,Gem_1,true)
			}
	}
		
		//bombspawn = -1 //reset bomb creating
		coalspawn = false
		if (match_replay) add_match_replay_keyframe(Gem_create, j)

		with(Gamerule_1) {
			if (replay_allowed & !juststarted)
			{
				add_combo_replay_keyframe(other.Gem_create, other.j)
			}
		}

}

/// @description Insert description here
// You can write your code in this editor
if !Gamerule_1.isReplay //REMOVE COMMENT WHEN NOT WIP
{
if !Gamerule_1.IsGemActive && !Gamerule_1.fruit_exploding && !Gamerule_1.hypeOn && !Gamerule_1.lightOn && Gamerule_1.spawnallowed && !Gamerule_1.flameon
{
	with(Gamerule_1) check_gaps(Board_1,Gem_1)
	for(j=0;j<=7;j++)
	{
		if Gamerule_1.gaps[j] > 0 && !collision_line( Board_1.x + j*64, Board_1.y-64, Board_1.x + j*64, Board_1.y+4, Gem_1, false, true ) && !position_meeting(Board_1.x + j*64, Board_1.y, gem_dissappear)
		{
			canspawn = true 			
			if canspawn
				{
					with(Gamerule_1) check_summoves(false)	
					if !spawn_specific
					{
						//FOR COAL\\
						with(obj_coal_control) if TurnsToSpawnRandom event_user(0) //Only if randomized, activate event(0) here
						Gem_create = instance_create_depth(Board_1.x + j*64,Board_1.y-64,-1,Gem_1)
						acctosend = 0
						idtosend1 = Gem_create.myid
						with(Gem_create) //set same speed
							{
								#region Make gem special
								if other.bombspawn > -1
								{
									var o = irandom_range(0,99)
									if o < 26
									{
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
									ds_list_add(Gamerule_1.list_of_coals,id)
								}
								#endregion
							
								#region Take vsp
								take_othervsp = true //take other vsp if its not glitching
								//unglitch
								if instance_place(x,y,Gem_1)
								{
									take_othervsp = false
									do y--
									until !instance_place(x,y,Gem_1)
								}
								if take_othervsp//get same vertical speed
								{
									l = 1
									found = false
									do
										{
											gemtofind = instance_position(x,y + l*64, Gem_1)
											if gemtofind != noone
												{
													acc = gemtofind.acc
													other.acctosend = acc
													found = true
												}
											l++
										}
									until l > 8 || found = true
								}
								#endregion
							}
					
						if Gamerule_1.summoves2 = 0 && !havedone && Gamerule_1.AHM_allowed
							{
								spawn_script(Gamerule_1,Gem_1)
							}
					}
					else
					{
						Gem_create = instance_create_depth(Board_1.x + j*64,Board_1.y-64,-1,Gem_1)
						var key = string(specific[j]) + string(j)
						var skin = spawn_specific_array[? key + "_skin"]
						with(Gem_create) //set same speed
							{
								set_skin(skin)
								amHype = other.spawn_specific_array[? key + "_amHype"]
								#region Take vsp
								take_othervsp = true //take other vsp if its not glitching
								//unglitch
								if instance_place(x,y,Gem_1)
								{
									take_othervsp = false
									do y--
									until !instance_place(x,y,Gem_1)
								}
								if take_othervsp//get same vertical speed
								{
									l = 1
									found = false
									do
										{
											gemtofind = instance_position(x,y + l*64, Gem_1)
											if gemtofind != noone
												{
													acc = gemtofind.acc
													other.acctosend = acc
													found = true
												}
											l++
										}
									until l > 8 || found = true
								}
								#endregion
							}
						specific[j]++
						specific_count++
						if specific_count = 64 {specific_count = 0; for(var K = 0; K <8; K++) {specific[K] = 0;} spawn_specific = false}
					}
					//bombspawn = -1 //reset bomb creating
					coalspawn = false
					#region MATCH REPLAY
						if match_replay
						{
							var key = string(7+match_up_index[j])+"-"+string(j)
							ds_map_add(Gamerule_1.Replay_match_map,key + "_spawn",Gem_create.skinnum)
							ds_map_add(Gamerule_1.Replay_match_map,key + "_amHype",Gem_create.amHype)
							ds_map_add(Gamerule_1.Replay_match_map,key + "_amBomb",Gem_create.amBomb)
							ds_map_add(Gamerule_1.Replay_match_map,key + "_countdown",Gem_create.countdown)
							ds_map_set(Gamerule_1.Replay_match_map,key + "_geodenum",Gem_create.geodenum)
							for(var u=0;u<Gem_create.geodenum;u++) ds_map_set(Gamerule_1.Replay_match_map,key + "_geodenum_points"+string(u),Gem_create.geodenum_points[u])
							match_up_index[j]++
						}
					#endregion
					#region REPLAY
						with(Gamerule_1)
						{
							if replay_allowed & !juststarted
							{
								var _J = other.j
								var key = string(up_index[_J]+8)+"-"+string(_J)
								
								ds_map_set(Replay_map, key + "amHype",other.Gem_create.amHype)
								ds_map_set(Replay_map, key + "skin",other.Gem_create.skinnum)
								ds_map_set(Replay_map, key + "power",0)
								ds_map_set(Replay_map, key + "amLocked",0)
								ds_map_set(Replay_map, key + "amBeingLocked",0)
								ds_map_set(Replay_map, key + "amBomb",other.Gem_create.amBomb)
								ds_map_set(Replay_map, key + "countdown",other.Gem_create.countdown)
								ds_map_set(Replay_map,key + "geodenum",other.Gem_create.geodenum)
								for(var K = 0; K<other.Gem_create.geodenum;K++)
								{
									ds_map_set(Replay_map,key + "geodenum_points"+string(K),other.Gem_create.geodenum_points[K])
								}
								up_index[_J]++
							}
						}
					#endregion
				}		
		}

	}
}
}
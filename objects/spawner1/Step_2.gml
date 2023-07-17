/// @description Insert description here
// You can write your code in this editor
if !Gamerule_1.isReplay //REMOVE COMMENT WHEN NOT WIP
{
if !Gamerule_1.IsGemActive && !Gamerule_1.fruit_exploding && !Gamerule_1.hypeOn && !Gamerule_1.lightOn && Gamerule_1.spawnallowed && !Gamerule_1.flameon
{
	with(Gamerule_1) check_gaps(Board_1,Gem_1)
	for(j=0;j<=7;j++)
	{
		if Gamerule_1.gaps[j] > 0
		{
			if !collision_line( Board_1.x + j*64, Board_1.y-64, Board_1.x + j*64, Board_1.y+4, Gem_1, false, true ) && !position_meeting(Board_1.x + j*64, Board_1.y, gem_dissappear)
			{
			#region BODY
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
									with(global.mynet)
									{
										buffer_seek(buffer,buffer_seek_start,0)
										buffer_write(buffer,buffer_u8,NN_MATCH_GEM_SPAWN)
										buffer_write(buffer,buffer_u8,other._j)
										buffer_write(buffer,buffer_u8,other.skinnum)
										//SECOND BUFFER\\
										network_send_packet(client_socket,buffer,buffer_tell(buffer))
									}
									if mypowerup > -1
									{
										var d = myid
										var p = mypowerup
										with(global.mynet)
										{
											buffer_seek(buffer,buffer_seek_start,0)
											buffer_write(buffer,buffer_u8,NN_MATCH_POWERUP_SPAWN)
											buffer_write(buffer,buffer_u8,d)
											buffer_write(buffer,buffer_u8,p)
											//SECOND BUFFER\\
											network_send_packet(client_socket,buffer,buffer_tell(buffer))
										}
									}
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
					
						if Gamerule_1.summoves2 = 0 && !havedone && Gamerule_1.AHM_allowed// && !Gamerule_1.juststarted
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
								#region online
								if Gamerule_1.ONLINE_give_gem_id
								{
									scr_add_gemid(Gamerule_1)
									with(global.mynet)
									{
										buffer_seek(buffer,buffer_seek_start,0)
										buffer_write(buffer,buffer_u8,NN_MATCH_GEM_SPAWN)
										buffer_write(buffer,buffer_u8,other._j)
										buffer_write(buffer,buffer_u8,other.skinnum)
										//SECOND BUFFER\\
										network_send_packet(client_socket,buffer,buffer_tell(buffer))
									}
								}
								#endregion
								amHype = other.spawn_specific_array[? key + "_amHype"]
								if amHype
								{
									with(global.mynet)
									{
										buffer_seek(buffer,buffer_seek_start,0)
										buffer_write(buffer,buffer_u8,NN_MATCH_DUALHYPE_MAKE_HYPE)
										buffer_write(buffer,buffer_u8,other.myid)
										network_send_packet(client_socket,buffer,buffer_tell(buffer))
									}
								}
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
			#endregion
			}
		}

	}
}
}
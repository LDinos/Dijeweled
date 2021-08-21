/// @description Insert description here
// You can write your code in this editor
if !Gamerule_1.IsGemActive && !Gamerule_1.fruit_exploding && !Gamerule_1.lightOn && !Gamerule_1.hypeOn && Gamerule_1.spawnallowed && !Gamerule_1.flameon
{
	with(Gamerule_1) check_gaps(Board_1,Gem_1)
	for(j=0;j<=7;j++)
	{
		if Gamerule_1.gaps[j] > 0 && !collision_line( Board_1.x + j*64, Board_1.y-64, Board_1.x + j*64, Board_1.y+4, Gem_1, false, true ) && !position_meeting(Board_1.x + j*64, Board_1.y, gem_dissappear)
		{		
					Gem_create = instance_create_depth(Board_1.x + j*64,Board_1.y-64,-1,Gem_1)
					acctosend = 0
					idtosend1 = Gem_create.myid
					with(Gem_create) //set same speed
						{
							
							var _J = other.j	
							var key = string(other.index[_J]+8) + "-" + string(_J)
							if is_undefined(Gamerule_1.Replay_map[? key + "skin"])
							{
								set_skin(irandom(6))
							}
							else
							{
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
								
							}
							other.index[_J]++
							if amBomb ds_list_add(Gamerule_1.list_of_bombs,id)
							
							
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
					
					
		}

	}
}

if Gamerule_1.IsGemActive2
{
	if alarm[0] = -1 alarm[0] = 25
}
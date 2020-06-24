/// @description Insert description here
// You can write your code in this editor
if !Gamerule_1.IsGemActive && !Gamerule_1.fruit_exploding && !Gamerule_1.lightOn && !Gamerule_1.hypeOn && Gamerule_1.spawnallowed && !Gamerule_1.flameon
{
	with(Gamerule_1) check_gaps(Board_1,Gem_1)
	for(j=0;j<=7;j++)
	{
		if Gamerule_1.gaps[j] > 0 && !collision_line( Board_1.x + j*64, Board_1.y-64, Board_1.x + j*64, Board_1.y+4, Gem_1, false, true ) && !position_meeting(Board_1.x + j*64, Board_1.y, gem_dissappear)
		{
			var Gem_create = instance_create_depth(Board_1.x + j*64,Board_1.y-64,-1,Gem_1)
			var skin = Replay_load[? string(7+match_up_index[j])+"-"+string(j) + "_spawn"]
			var am_Hype = Replay_load[? string(7+match_up_index[j])+"-"+string(j) + "_amHype"]
			var geode_num = Replay_load[? string(7+match_up_index[j])+"-"+string(j) + "_geodenum"]
			Gem_create.geodenum_points = -1 //reset array
			for(var K = 0; K<geode_num;K++)
			{
				Gem_create.geodenum_points[K] = Replay_load[? string(7+match_up_index[j])+"-"+string(j) + "_geodenum_points"+string(K)]
			}
			match_up_index[j]++
			acctosend = 0
			idtosend1 = Gem_create.myid
			with(Gem_create) //set same speed
				{		
					set_skin(skin)
					amHype = am_Hype
					amBomb = other.Replay_load[? string(7+other.match_up_index[other.j])+"-"+string(other.j) + "_amBomb"]
					countdown = other.Replay_load[? string(7+other.match_up_index[other.j])+"-"+string(other.j) + "_countdown"]
					geodenum = geode_num
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

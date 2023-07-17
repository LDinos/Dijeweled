/// @description Insert description here
// You can write your code in this editor
var board = Board_local
if !Gamerule_local.IsGemActive && !Gamerule_local.hypeOn && !Gamerule_local.lightOn && Gamerule_1.spawnallowed && !Gamerule_local.flameon
{
	with(Gamerule_local) check_gaps(board,Gem_local)
	for(j=0;j<=7;j++)
	{
		if Gamerule_local.gaps[j] > 0
		{
			if !collision_line( board.x + j*64, board.y-64, board.x + j*64, board.y+4, Gem_local, false, true ) && !position_meeting(board.x + j*64, board.y, gem_dissappear_local)
			{
			#region BODY
			canspawn = true 
			if canspawn
				{
					with(Gamerule_local) check_summoves(false)
					if !spawn_specific
					{
						//FOR COAL\\
						Gem_create = instance_create_depth(board.x + j*64,board.y-64,-1,Gem_local)
						acctosend = 0
						idtosend1 = Gem_create.myid
						with(Gem_create) //set same speed
							{
							
								#region Take vsp
								take_othervsp = true //take other vsp if its not glitching
								//unglitch
								if instance_place(x,y,Gem_local)
								{
									take_othervsp = false
									do y--
									until !instance_place(x,y,Gem_local)
								}
								if take_othervsp//get same vertical speed
								{
									l = 1
									found = false
									do
										{
											gemtofind = instance_position(x,y + l*64, Gem_local)
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
					
						if Gamerule_local.summoves2 = 0 && !havedone && Gamerule_1.AHM_allowed// && !Gamerule_1.juststarted
							{
								spawn_script(Gamerule_local,Gem_local)
							}
					}
					else
					{
						Gem_create = instance_create_depth(board.x + j*64,board.y-64,-1,Gem_local)
						var key = string(specific[j]) + string(j)
						var skin = spawn_specific_array[? key + "_skin"]
						with(Gem_create) //set same speed
							{
								set_skin(skin)
								amHype = other.spawn_specific_array[? key + "_amHype"]
								take_othervsp = true //take other vsp if its not glitching
								//unglitch
								if instance_place(x,y,Gem_local)
								{
									take_othervsp = false
									do y--
									until !instance_place(x,y,Gem_local)
								}
								if take_othervsp//get same vertical speed
								{
									l = 1
									found = false
									do
										{
											gemtofind = instance_position(x,y + l*64, Gem_local)
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

				}
			}
		}

	}
}

/// @description Insert description here
if !Gamerule_local.IsGemActive && !Gamerule_local.hypeOn && !Gamerule_local.lightOn && Gamerule_1.spawnallowed && !Gamerule_local.flameon
{
	with(Gamerule_local) check_gaps(Board_local,Gem_local)	
	for(j=0;j<=7;j++)
	{
		if obj_avalanchedeposit_local.hidden_gems > 0
		{
			if Gamerule_local.gaps[j] > 0
			{
				if !collision_line( Board_local.x + j*64, Board_local.y-64, Board_local.x + j*64, Board_local.y+4, Gem_local, false, true ) && !position_meeting(Board_local.x + j*64, Board_local.y, gem_dissappear_local)
				{
				#region BODY
				var canspawn = true 
				if canspawn
					{
						with(Gamerule_1) check_summoves(false)				
						//FOR COAL\\					
						Gem_create = instance_create_depth(Board_local.x + j*64,Board_local.y-64,-1,Gem_local)
						obj_avalanchedeposit_local.hidden_gems--
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
					
						if Gamerule_local.summoves2 = 0 && !havedone && Gamerule_local.AHM_allowed// && !Gamerule_1.juststarted
							{
								spawn_script(Gamerule_local,Gem_local,false)
							}	
					}
				#endregion
				}
			}
		}
	}
}

if Gamerule_local.IsGemActive2
{
	if obj_avalanchedeposit_local.gems_existing >= 64
	{
		with(obj_music) if !isdanger event_user(0)
	}
	else
	{
		with(obj_music) if isdanger event_user(1)
	}
}
///@param GM
///@param mouse_x
///@param mouse_y
///@param canmove
///@param multiswap_allowed
///@param change_xy
///@param Gamerule
var GM = argument0
var canmove = argument3
var multiswap_allowed = argument4
var amnotgamepad = argument5
var MyGamerule = argument6
var MyBoard = Board_1
if (MyGamerule == Gamerule_local) MyBoard = Board_local


if !GM.amLocked //&& !GM.ammoving //if gem that we want to check is not locked or moving due to match
		{	
			var domatch = false;
				xlimprevious = xlim
				ylimprevious = ylim
				xlim = GM._j
				ylim = GM._i
				x = MyBoard.x + 64*xlim - 32
				y = MyBoard.y + 64*ylim - 32
		
				if gem1 = noone //if we havent selected any gems yet
				{
					if !GM.amInvisible //if its not invinsible
					{
						gem1 = GM //we now have gem1
						mouse_xx_pos = argument1
						mouse_yy_pos = argument2	
						GM = noone
						audio_play_sound(snd_gemselection,0,0)
						with(gem1) spin()
					}
					else {gem1 = noone; GM = noone}
				}
				else if gem1 = MyGamerule.gem_board1[@ylim,xlim] //if we have a gem1 and that gem1 is the gem we just selected
				{
					with(gem1) unspin() //unselect
					gem1 = noone
					GM = noone
				}
				else if is_close_distance(gem1,xlim,ylim)
					{
						var hor = is_swap_horizontal(gem1,xlim,ylim)
						if (MyGamerule.vertical_swaps_only && hor) canmove = false
						else if (MyGamerule.horizontal_swaps_only && !hor) canmove = false
						#region inverted swaps
						if MyGamerule.inverted_swaps
						{						
							if hor
							{
								#region horizontal
								if (xlim - xlimprevious < 0) //we swapped left
								{
									if xlimprevious != 7
									{
										if (MyGamerule.gem_board1[ylim,xlim+2] != noone)
										{
											xlim += 2 //we go to the right two places
											x = MyBoard.x + 64*xlim - 32
										}
										else canmove = false								
									}
									else
									{
										xlim = xlimprevious
										x = MyBoard.x + 64*xlim - 32
										canmove = false
									}
								}
								else
								{
									if xlimprevious != 0
									{
										if (MyGamerule.gem_board1[ylim,xlim-2] != noone)
										{
											xlim -= 2 //we go to the right two places
											x = MyBoard.x + 64*xlim - 32
										}
										else canmove = false								
									}
									else
									{
										xlim = xlimprevious
										x = MyBoard.x + 64*xlim - 32
										canmove = false
									}
								}
								#endregion
							}
							else
							{
								#region vertical
								if (ylim - ylimprevious < 0) //we swapped up
								{
									if ylimprevious != 7
									{
										if (MyGamerule.gem_board1[ylim+2,xlim] != noone)
										{
											ylim += 2 //we go to the right two places
											y = MyBoard.y + 64*ylim - 32
										}
										else canmove = false								
									}
									else
									{
										ylim = ylimprevious
										y = MyBoard.y + 64*ylim - 32
										canmove = false
									}
								}
								else
								{
									if ylimprevious != 0
									{
										if (MyGamerule.gem_board1[ylim-2,xlim] != noone)
										{
											ylim -= 2 //we go to the right two places
											y = MyBoard.y + 64*ylim - 32
										}									
										else canmove = false								
									}
									else
									{
										ylim = ylimprevious
										y = MyBoard.y + 64*ylim - 32
										canmove = false
									}
								}
								#endregion
							}
							if MyGamerule.gem_board1[ylim,xlim].amLocked canmove = false 
						}
						#endregion
						if canmove && multiswap_allowed
						{
							gem2 = MyGamerule.gem_board1[@ylim,xlim]
							if !gem1.amLit && !gem2.amLit && gem2.acc = 0 && ((gem1.y - MyBoard.y) mod 64 <= 1|| (gem1.y - MyBoard.y) mod 64 >= 62)
							{
								if (gem1.amHype && gem2.amInvisible) || (gem1.amHype && !MyGamerule.IsGemActive2) || (gem2.amHype && !MyGamerule.IsGemActive2)//dont match if hype goes with inv
								{
									gem2 = noone
								}
								else
								{
									with(gem1) unspin()
									xx1 = gem1.x
									yy1 = gem1.y
									xx2 = gem2.x
									yy2 = gem2.y
									//if xx1 == xx2 show_debug_message("CLICK (V): " +string(abs(yy1-yy2)))
									//else show_debug_message("CLICK (H): " +string(abs(xx1-xx2)))
									do_match(MyGamerule)
									#region match_replay
										if match_replay
										{
											ds_map_add(MyGamerule.Replay_match_map,string(MyGamerule.cur_time),MyGamerule.cur_time)
											var key = "gamepad" + string(MyGamerule.cur_time)
											ds_map_add(MyGamerule.Replay_match_map,key,false)
											var key = "xlim_previous" + string(MyGamerule.cur_time)
											ds_map_add(MyGamerule.Replay_match_map,key,xlimprevious)
											key = "ylim_previous" + string(MyGamerule.cur_time)
											ds_map_add(MyGamerule.Replay_match_map,key,ylimprevious)
											key = "xlim_" + string(MyGamerule.cur_time)
											ds_map_add(MyGamerule.Replay_match_map,key,xlim)
											key = "ylim_" + string(MyGamerule.cur_time)
											ds_map_add(MyGamerule.Replay_match_map,key,ylim)
										}
									#endregion
									domatch = true
								}
							}
							else gem2 = noone
							GM = noone
						}
					}
				else //if gem1 exists, and we select a gem far away
					{
						if !GM.amInvisible
						{
							mouse_xx_pos = argument1
							mouse_yy_pos = argument2
							with(gem1) unspin()
							gem1 = MyGamerule.gem_board1[@ylim,xlim] //make new gem1
							with(gem1) spin()
						}
						//else gem1 = noone
						GM = noone
					}
					
			}
			else GM = noone
return noone;
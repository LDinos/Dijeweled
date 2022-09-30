/// @description Insert description here
// You can write your code in this editor
if !global.paused
{
var multiswap_allowed; //if multiswap_allowed is allowed, we dont care if gems are stationary.
if Gamerule_1.multiswap_allowed multiswap_allowed = true
else
{
	if Gamerule_1.IsGemActive2 multiswap_allowed = true
	else multiswap_allowed = false
}
var canmove;
if !Gamerule_1.moving && !dont_swap && !Gamerule_1.lightOn && !Gamerule_1.fruit_exploding && !Gamerule_1.fruit_want_to_spawn && !Gamerule_1.fruit_spawning && Gamerule_1.illegal_cando canmove = true
else canmove = false

if gem1 != noone && !visible //instance_exists(gem1)
{
	#region Refresh xlim,ylim on moving gem
	if gem1.acc != 0
	{
		mouse_xx_pos = gem1.x
		mouse_yy_pos = gem1.y
		xlimprevious = xlim
		ylimprevious = ylim
		xlim = gem1._j
		ylim = gem1._i
		x = Board_1.x + 64*xlim -32
		y = Board_1.y + 64*ylim -32
	}
	#endregion
}

if !Gamerule_1.skullis0 && !Gamerule_1.bombis0 && Gamerule_1.controlallowed && !Gamerule_1.isReplay //&& !global.bot1 && Gamerule_1.summoves2 > 0
{
if (image_index == 1) image_index = 0

if mouse_check_button_pressed(mb_left) //PRESSED ONCE (MOUSE)\\
	{
		if instance_position(mouse_x,mouse_y,Gem_1) != noone //if mouse is onto a gem when clicked
		{
			visible = false
			gemtocheck = instance_position(mouse_x,mouse_y,Gem_1)
			gemtocheck = scr_gem_click_script(gemtocheck,mouse_x,mouse_y,canmove,multiswap_allowed,true,Gamerule_1)
		}
	}
else if mouse_check_button(mb_left)
	{
		#region MOUSE HOLD
		if !Gamerule_1.lightOn
		{
			if gem1 != noone //instance_exists(gem1)
			{
				if gem1.acc != 0
				{
					mouse_yy_pos = gem1.y
					mouse_xx_pos = gem1.x
					gemtocheck = noone
					xlimprevious = xlim
					ylimprevious = ylim
					xlim = gem1._j
					ylim = gem1._i
				}
				else
				{
					var makematch = false
					var mousexx = mouse_x
					var mouseyy = mouse_y
					if (abs(mouse_xx_pos - mousexx) > 16) || (abs(mouse_yy_pos - mouseyy) > 16)
					{
						if abs(mouse_xx_pos - mousexx) > abs(mouse_yy_pos - mouseyy)
						{
							var makematch = true
							if (Gamerule_1.vertical_swaps_only) makematch = false
							var s = sign(mousexx - mouse_xx_pos)
							if Gamerule_1.inverted_swaps s*=-1
							if s = -1
							{
								if (xlim + s >= 0)
								{
									 gemtocheck = Gamerule_1.gem_board1[ylim,xlim+s]
								}
							}
							else if s = 1
							{
								if (xlim + s <= 7)
								{
									 gemtocheck = Gamerule_1.gem_board1[ylim,xlim+s]
								}
							}
						}
						else
						{
							var makematch = true
							if (Gamerule_1.horizontal_swaps_only) makematch = false
							var s = sign(mouseyy - mouse_yy_pos)
							if Gamerule_1.inverted_swaps s*=-1
							if s = -1
							{
								if (ylim + s >= 0)
								{
									 gemtocheck = Gamerule_1.gem_board1[ylim+s,xlim]
								}
							}
							else if s = 1
							{
								if (ylim + s <= 7)
								{
									 gemtocheck = Gamerule_1.gem_board1[ylim+s,xlim]
								}
							}
						}
					}
					#region all conditions
					if instance_exists(gemtocheck) && makematch && (gemtocheck != gem1) //gemtocheck != noone
					{
						if gemtocheck.acc = 0 && !gemtocheck.ammoving  && !gemtocheck.amLocked
						{	
							if canmove && multiswap_allowed //!Gamerule_1.moving && !dont_swap && !Gamerule_1.fruit_exploding && !Gamerule_1.fruit_want_to_spawn && !Gamerule_1.fruit_spawning
							{
								gem2 = gemtocheck
								if (gem1._i == gem2._i && abs(gem1._j - gem2._j) == 1) || ((gem1._j == gem2._j) && abs(gem1._i - gem2._i) == 1)
								{
									if gem1.acc = 0 && !gem1.ammoving //!gem1.amLit && !gem2.amLit &&
									{
										if (gem1.amHype && gem2.amInvisible) || (gem1.amHype && !Gamerule_1.IsGemActive2) || (gem2.amHype && !Gamerule_1.IsGemActive2)//dont match if hype goes with inv
										{
											gem2 = noone
											gemtocheck = noone
										}
										else
										{
											xlimprevious = xlim
											ylimprevious = ylim
											xlim = gem2._j
											ylim = gem2._i
											x = Board_1.x + 64*xlim - 32
											y = Board_1.y + 64*ylim - 32
											with(gem1) unspin()
											gemtocheck = noone
											do_match(Gamerule_1)
											#region match_replay
												if match_replay
												{
													ds_map_add(Gamerule_1.Replay_match_map,string(Gamerule_1.cur_time),Gamerule_1.cur_time)
													var key = "xlim_previous" + string(Gamerule_1.cur_time)
													ds_map_add(Gamerule_1.Replay_match_map,key,xlimprevious)
													key = "ylim_previous" + string(Gamerule_1.cur_time)
													ds_map_add(Gamerule_1.Replay_match_map,key,ylimprevious)
													key = "xlim_" + string(Gamerule_1.cur_time)
													ds_map_add(Gamerule_1.Replay_match_map,key,xlim)
													key = "ylim_" + string(Gamerule_1.cur_time)
													ds_map_add(Gamerule_1.Replay_match_map,key,ylim)
												}
											#endregion
											gem2 = noone
										}
									}
									else gem2 = noone
									gemtocheck = noone
								}
								else
								{
									gem2 = noone
									gemtocheck = noone
								}
							}
							else //if canmove = false
							{
								mouse_yy_pos = gem1.y
								mouse_xx_pos = gem1.x
								gemtocheck = noone
								xlimprevious = xlim
								ylimprevious = ylim
								xlim = gem1._j
								ylim = gem1._i
							}
						}
						else gemtocheck = noone
					}
					#endregion
				}
			}
		}
		#endregion
	}
	
#region GAMEPAD / KEYBOARD
	var press = false
	var distx = 0
	var disty = 0
	#region swap buttons
	if !Gamerule_1.moving
	{
		var condition;
		var xxx,yyy,xxx2,yyy2;
		var swap_pressed = false;
		var swapped_down = false;
		var swapped_right = false;
		var swapped_up = false;
		var swapped_left = false;
		if !Gamerule_1.inverted_swaps
		{
			swapped_right = gamepad_button_swap_check(global.gp[0],global.GP_swapright,Gamerule_1) || keyboard_swap_check(ord("D"),Gamerule_1)
			swapped_down = gamepad_button_swap_check(global.gp[0],global.GP_swapdown,Gamerule_1) || keyboard_swap_check(ord("S"),Gamerule_1)
			swapped_up = gamepad_button_swap_check(global.gp[0],global.GP_swapup,Gamerule_1) || keyboard_swap_check(ord("W"),Gamerule_1)
			swapped_left = gamepad_button_swap_check(global.gp[0],global.GP_swapleft,Gamerule_1) || keyboard_swap_check(ord("A"),Gamerule_1)
		}
		else
		{
			swapped_right = gamepad_button_swap_check(global.gp[0],global.GP_swapleft,Gamerule_1) || keyboard_swap_check(ord("A"),Gamerule_1)
			swapped_down = gamepad_button_swap_check(global.gp[0],global.GP_swapup,Gamerule_1) || keyboard_swap_check(ord("W"),Gamerule_1)
			swapped_up = gamepad_button_swap_check(global.gp[0],global.GP_swapdown,Gamerule_1) || keyboard_swap_check(ord("S"),Gamerule_1)
			swapped_left = gamepad_button_swap_check(global.gp[0],global.GP_swapright,Gamerule_1) || keyboard_swap_check(ord("D"),Gamerule_1)
		}
		
		if swapped_down && !Gamerule_1.horizontal_swaps_only//swap down
		{
			swap_pressed = true
			set_hybrid_position(Board_1)
			condition = (ylim < 7)
			xxx = xlim
			xxx2 = xlim
			yyy = ylim
			yyy2 = ylim+1
		}
		else if swapped_right && !Gamerule_1.vertical_swaps_only//swap right
		{
			swap_pressed = true
			set_hybrid_position(Board_1)
			condition = (xlim < 7)
			xxx = xlim
			xxx2 = xlim+1
			yyy = ylim
			yyy2 = ylim
		}
		else if swapped_up && !Gamerule_1.horizontal_swaps_only
		{
			swap_pressed = true
			set_hybrid_position(Board_1)
			condition = (ylim > 0)
			xxx = xlim
			xxx2 = xlim
			yyy = ylim
			yyy2 = ylim-1
		}
		else if swapped_left && !Gamerule_1.vertical_swaps_only
		{
			swap_pressed = true
			set_hybrid_position(Board_1)
			condition = (xlim > 0)
			xxx = xlim
			xxx2 = xlim-1
			yyy = ylim
			yyy2 = ylim
		}
		if (swap_pressed && !position_meeting(mouse_x,mouse_y,Board_1) && !visible) swap_pressed = false //if hybrid when mouse is outside the board
		if swap_pressed //swap down
		{
			if condition
			{
				var g1 = instance_position(Board_1.x + 64*xxx,Board_1.y + 64*yyy,Gem_1)
				var g2 = instance_position(Board_1.x + 64*xxx2,Board_1.y + 64*yyy2,Gem_1)
				if instance_exists(g1) && instance_exists(g2)
				{
					if (!g1.amLocked && !g2.amLocked) && (!g1.amInvisible)
					{
						with(gem1) unspin()
						with(gem2) unspin()
						gem1 = g1
						gem2 = g2
						if canmove && multiswap_allowed
						{
							if !gem1.amLit && !gem2.amLit && gem2.acc = 0 && gem1.acc = 0
							{
								if (gem1.amHype && !Gamerule_1.IsGemActive2) || (gem2.amHype && !Gamerule_1.IsGemActive2)
								{
									gem1 = noone
									gem2 = noone
								}
								else
								{
									with(gem1) unspin()
									with(gem2) unspin()
									xlimprevious = gem1._j
									ylimprevious = gem1._i
									xlim = gem2._j //set xlim, ylim to these values so replay works
									ylim = gem2._i //same for ylim
									xx1 = gem1.x
									yy1 = gem1.y
									xx2 = gem2.x
									yy2 = gem2.y
									do_match(Gamerule_1)
									#region match_replay
										if match_replay
										{
											ds_map_add(Gamerule_1.Replay_match_map,string(Gamerule_1.cur_time),Gamerule_1.cur_time)
											var key = "gamepad" + string(Gamerule_1.cur_time)
											ds_map_add(Gamerule_1.Replay_match_map,key,false)
											var key = "xlim_previous" + string(Gamerule_1.cur_time)
											ds_map_add(Gamerule_1.Replay_match_map,key,xxx)
											key = "ylim_previous" + string(Gamerule_1.cur_time)
											ds_map_add(Gamerule_1.Replay_match_map,key,yyy)
											key = "xlim_" + string(Gamerule_1.cur_time)
											ds_map_add(Gamerule_1.Replay_match_map,key,xxx2)
											key = "ylim_" + string(Gamerule_1.cur_time)
											ds_map_add(Gamerule_1.Replay_match_map,key,yyy2)
										}
									#endregion
									xlim = xlimprevious //and return it to the previous position
									ylim = ylimprevious
								}
							}
						}
						else with(gem1) unspin()
					}
					else with(gem1) unspin()
				}
				else with(gem1) unspin()
			}
			else with(gem1) unspin()
			gem1 = noone
			gem2 = noone
			gemtocheck = noone
		}
	}
	#endregion

	#region move buttons
	var previous_button = current_button
	if gamepad_button_swap_check(global.gp[0],gp_padd,Gamerule_1) || keyboard_swap_check(vk_down,Gamerule_1)
	{
		current_button = 1
		press = true
		disty++
	}
	if gamepad_button_swap_check(global.gp[0],gp_padu,Gamerule_1) || keyboard_swap_check(vk_up,Gamerule_1)
	{
		current_button = 2
		press = true
		disty--
	}
	if gamepad_button_swap_check(global.gp[0],gp_padl,Gamerule_1) || keyboard_swap_check(vk_left,Gamerule_1)
	{
		current_button = 3
		press = true
		distx--
	}
	if gamepad_button_swap_check(global.gp[0],gp_padr,Gamerule_1) || keyboard_swap_check(vk_right,Gamerule_1)
	{
		current_button = 4
		press = true
		distx++
	}
	#endregion

	if press
	{
		if (previous_button != current_button) gamepad_can_move = 0 //reset cooldown if we pressed a different button
		if (gamepad_can_move <= 0)
		{
			if gamepad_first_hit {gamepad_can_move = 10; gamepad_first_hit = false}
			else {gamepad_can_move = 5}
		var cond;
		visible = true
		#region xlim
		if distx > 0 //right
		{
			cond = (xlim < 7)
		}
		else if distx < 0
		{
			cond = (xlim > 0)
		}
		else cond = false
		
		if cond
		{
			xlimprevious = xlim
			xlim += sign(distx)
			x+= distx*64
		}
		#endregion
		#region ylim
		if disty > 0 //right
		{
			cond = (ylim < 7)
		}
		else if disty < 0
		{
			cond = (ylim > 0)
		}
		else cond = false
		
		if cond
		{
			ylimprevious = ylim
			ylim += sign(disty)
			y+= disty*64
		}
		#endregion
		}
		else gamepad_can_move--
	}
	else {gamepad_can_move = 0; gamepad_first_hit = true} //0 = you can press. 5 = time limit like an alarm
	
#endregion
}

if !Gamerule_1.illegal_cando image_index = 1
else image_index = 0

}
//



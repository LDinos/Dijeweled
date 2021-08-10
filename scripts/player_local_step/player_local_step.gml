var canmove = argument0
var multiswap_allowed = argument1
	
#region GAMEPAD
	var press = false
	var distx = 0
	var disty = 0
	#region swap buttons
	if !MyGamerule.moving
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
			swapped_right = gamepad_button_swap_check(global.gp[1],global.GP_swapright,Gamerule_local) || keyboard_swap_check(ord("D"),Gamerule_local)
			swapped_down = gamepad_button_swap_check(global.gp[1],global.GP_swapdown,Gamerule_local) || keyboard_swap_check(ord("S"),Gamerule_local)
			swapped_up = gamepad_button_swap_check(global.gp[1],global.GP_swapup,Gamerule_local) || keyboard_swap_check(ord("W"),Gamerule_local)
			swapped_left = gamepad_button_swap_check(global.gp[1],global.GP_swapleft,Gamerule_local) || keyboard_swap_check(ord("A"),Gamerule_local)
		}
		else
		{
			swapped_right = gamepad_button_swap_check(global.gp[1],global.GP_swapleft,Gamerule_local) || keyboard_swap_check(ord("A"),Gamerule_local)
			swapped_down = gamepad_button_swap_check(global.gp[1],global.GP_swapup,Gamerule_local) || keyboard_swap_check(ord("W"),Gamerule_local)
			swapped_up = gamepad_button_swap_check(global.gp[1],global.GP_swapdown,Gamerule_local) || keyboard_swap_check(ord("S"),Gamerule_local)
			swapped_left = gamepad_button_swap_check(global.gp[1],global.GP_swapright,Gamerule_local) || keyboard_swap_check(ord("D"),Gamerule_local)
		}
		
		if swapped_down && !Gamerule_1.horizontal_swaps_only//swap down
		{
			swap_pressed = true
			set_hybrid_position(MyBoard)
			condition = (ylim < 7)
			xxx = xlim
			xxx2 = xlim
			yyy = ylim
			yyy2 = ylim+1
		}
		else if swapped_right && !Gamerule_1.vertical_swaps_only//swap right
		{
			swap_pressed = true
			set_hybrid_position(MyBoard)
			condition = (xlim < 7)
			xxx = xlim
			xxx2 = xlim+1
			yyy = ylim
			yyy2 = ylim
		}
		else if swapped_up && !Gamerule_1.horizontal_swaps_only
		{
			swap_pressed = true
			set_hybrid_position(MyBoard)
			condition = (ylim > 0)
			xxx = xlim
			xxx2 = xlim
			yyy = ylim
			yyy2 = ylim-1
		}
		else if swapped_left && !Gamerule_1.vertical_swaps_only
		{
			swap_pressed = true
			set_hybrid_position(MyBoard)
			condition = (xlim > 0)
			xxx = xlim
			xxx2 = xlim-1
			yyy = ylim
			yyy2 = ylim
		}

		if swap_pressed //swap down
		{
			if condition
			{
				var g1 = instance_position(MyBoard.x + 64*xxx,MyBoard.y + 64*yyy,MyGem)
				var g2 = instance_position(MyBoard.x + 64*xxx2,MyBoard.y + 64*yyy2,MyGem)
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
								if (gem1.amHype && !MyGamerule.IsGemActive2) || (gem2.amHype && !MyGamerule.IsGemActive2)
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
									do_match(MyGamerule)
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
	if gamepad_button_swap_check(global.gp[1],gp_padd,Gamerule_local) || keyboard_swap_check(vk_down,Gamerule_local)
	{
		//alarm[0] = -1
		current_button = 1
		press = true
		disty++
	}
	if gamepad_button_swap_check(global.gp[1],gp_padu,Gamerule_local) || keyboard_swap_check(vk_up,Gamerule_local)
	{
		//alarm[0] = -1
		current_button = 2
		press = true
		disty--
	}
	if gamepad_button_swap_check(global.gp[1],gp_padl,Gamerule_local) || keyboard_swap_check(vk_left,Gamerule_local)
	{
		//alarm[0] = -1
		current_button = 3
		press = true
		distx--
	}
	if gamepad_button_swap_check(global.gp[1],gp_padr,Gamerule_local) || keyboard_swap_check(vk_right,Gamerule_local)
	{
		//alarm[0] = -1
		current_button = 4
		press = true
		distx++
	}
	#endregion

	if press
	{
		if (previous_button != current_button) gamepad_can_move = 0 //reset cooldown if we pressed a different button
		if (gamepad_can_move <= 0) //if we have no time cooldown
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
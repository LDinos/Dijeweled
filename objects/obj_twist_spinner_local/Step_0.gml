/// @description Insert description here
if !global.bot1
{
	#region player
	#region keyboard_controls
		var key_right = keyboard_swap_check(vk_right,Gamerule_local) || gamepad_button_swap_check(global.gp[0],gp_padr,Gamerule_local);
		var key_left = keyboard_swap_check(vk_left,Gamerule_local) || gamepad_button_swap_check(global.gp[0],gp_padl,Gamerule_local);
		var key_down = keyboard_swap_check(vk_down,Gamerule_local) || gamepad_button_swap_check(global.gp[0],gp_padd,Gamerule_local);
		var key_up = keyboard_swap_check(vk_up,Gamerule_local) || gamepad_button_swap_check(global.gp[0],gp_padu,Gamerule_local);
	
		var mx = mouse_x;
		var my = mouse_y;
		var cycle_cw = gamepad_button_swap_check_pressed(global.gp[0], global.GP_clockwise2,Gamerule_local) || gamepad_button_swap_check_pressed(global.gp[0], global.GP_clockwise1,Gamerule_local) || keyboard_swap_check_pressed(vk_space,Gamerule_local);
		var cycle_ccw = gamepad_button_swap_check_pressed(global.gp[0], global.GP_cclockwise1,Gamerule_local) || gamepad_button_swap_check_pressed(global.gp[0], global.GP_cclockwise2,Gamerule_local) || keyboard_swap_check_pressed(vk_shift,Gamerule_local);
	
		if (!os_is_phone()) {
			//MOUSE NOT AVAILABLE HERE
			//var cycle_cw = mouse_check_button_pressed(mb_left) || cycle_cw;
			//var cycle_ccw = mouse_check_button_pressed(mb_right) || cycle_ccw;
		} else {
		
			var touch_x = [device_mouse_x(0),device_mouse_x(1)];
			var touch_y = [device_mouse_y(0),device_mouse_y(1)];
		
			touchedBoard = false;
			touchedCCW   = false;
		
			// check up to three touches
			for(var i=0;i<2;i++) {
				var mb_released = device_mouse_check_button_released(i,mb_left);
				var mb_button = device_mouse_check_button(i,mb_left);
			
				if (mb_button or mb_released) and (touch_x[i]-MyBoard.x) div 64 >= 0 and (touch_x[i]-MyBoard.x) div 64 <= 8
				and (touch_y[i]-MyBoard.y) div 64 >= 0 and (touch_y[i]-MyBoard.y) div 64 <= 8 {
					// else if on the gameboard, set the spinner on the board
					mx = touch_x[i]; my = touch_y[i];
					// and if touch was released that frame, spin it
					if mb_released {
						touchedBoard = true;
					}
				}
			
				// if holding down touch
				if mb_button {
					// and in the region of directional button, swap to ccw direction
					touchedCCW = (touch_x[i] >= buttonX and touch_x[i] < buttonX+buttonW and touch_y[i] >= buttonY and touch_y[i] < buttonY+buttonH) || touchedCCW;
				} 
			
			
			}
				
			var cycle_cw = (touchedBoard && !touchedCCW) || cycle_cw;
			var cycle_ccw = (touchedBoard && touchedCCW) || cycle_ccw;
		}
	#endregion

	//MOUSE NOT AVAILABLE HERE
	/*if (prev_mousey != my || prev_mousex != mx)
	{
		keyboard_control = false
	}
	prev_mousex = mx
	prev_mousey = my*/

	var previ = pos_i
	var prevj = pos_j

	if !keyboard_control
	{
	pos_j = (mx - MyBoard.x) div 64
	pos_i = (my - MyBoard.y) div 64
	}

	#region keyboard/gamepad
		var pres = false
		var previous_button = current_button
		if key_right { keyboard_control = true; pres = true; current_button = 1}
		if key_left {keyboard_control = true; pres = true; current_button = 2}
		if key_down { keyboard_control = true; pres = true; current_button = 3}
		if key_up {keyboard_control = true; pres = true; current_button = 4}
		if pres
		{
			if (previous_button != current_button) gamepad_can_move = 0 //reset the cooldown to 0
			if (gamepad_can_move <= 0)
			{
				if gamepad_first_hit {gamepad_can_move = 10; gamepad_first_hit = false}
				else {gamepad_can_move = 5}
				if key_right {if pos_j < 6 pos_j++; keyboard_control = true}
				if key_left {if pos_j > 0 pos_j--;keyboard_control = true}
				if key_down {if pos_i < 6 pos_i++;keyboard_control = true}
				if key_up {if pos_i > 0 pos_i--;keyboard_control = true}
			}
			else gamepad_can_move--
		}
		else {gamepad_can_move = 0; gamepad_first_hit = true}
		#endregion


	var out_of_bounds = false

	if pos_j == 7 pos_j = 6
	else if (pos_j > 7) || (pos_j < 0) {pos_j =-1; out_of_bounds = true}
	if pos_i == 7 pos_i = 6
	else if (pos_i > 7) || (pos_i < 0) {pos_i = -1; out_of_bounds = true}

	rot-= 1 - touchedCCW*2
	while rot<0 rot+=360;
	while rot>=360 rot-=360;

	if !out_of_bounds
	{
		if (previ != pos_i || pos_j != prevj) audio_play_sound(snd_twist_select,0,0)
		x = MyBoard.x +32 +64*pos_j
		y = MyBoard.y + 32 + 64*pos_i
	
		var cc = 0 //clockwise = 1, counter-clockwise = 2, 0 = no mouse pressed
		if cycle_cw { 
			cc = 1
		} else if cycle_ccw {
			cc = 2
		}
	
		if cc != 0
		{
			var canmove;
			if (!MyGamerule.lightOn && !MyGamerule.moving && Gamerule_1.controlallowed && !MyGamerule.bombis0 && MyGamerule.illegal_cando) canmove = true
			else canmove = false
		
			if !MyGamerule.multiswap_allowed && !MyGamerule.IsGemActive2 //MyGamerule.moving
			{
				canmove = false
			}
		
			if canmove
			{
			
				var gems;
				gems[0] = MyGamerule.gem_board1[pos_i,pos_j]
				gems[1] = MyGamerule.gem_board1[pos_i,pos_j+1]
				gems[2] = MyGamerule.gem_board1[pos_i+1,pos_j+1]
				gems[3] = MyGamerule.gem_board1[pos_i+1,pos_j]
		
				var ready = true;
				for(var i = 0; i<4;i++)
				{
					if (gems[i] == noone)
					{
						ready = false
						break;
					}
					else if gems[i].ammoving
					{
						ready = false
						break;
					}
					else if gems[i].acc != 0
					{
						ready = false
						break;
					}
					else if gems[i].amLocked > 0
					{
						ready = false
						break;
					}
				}
			
				if ready
				{
					with(obj_avalanchedeposit_local) ammoving = true
					MyGamerule.moving = true
					gems[0].ammoving = true
					gems[1].ammoving = true
					gems[2].ammoving = true
					gems[3].ammoving = true
					var col = instance_create(x-64,y-64,obj_twist_collider_local)
					with(col)
					{
						scr_twist_swap(gems,cc)
					}
					with(MyGamerule)
					{
						if !isReplay
						{
							//show_message("I am true now")
							swap_happened = true
							alarm[9] = 1 
						}
						combo = 0
						juststarted = false; 
						gemdestroyonemove =0; 
						reset_compliments()
					}
					var list_of_bombs = MyGamerule.list_of_bombs
					var list_of_skulls = MyGamerule.list_of_skulls
					for(i=0;i<ds_list_size(list_of_bombs);i++)
					{
						with(list_of_bombs[| i])
						{
							countdown_decrease()
						}
					}
					for(i=0;i<ds_list_size(list_of_skulls);i++)
					{
						with(list_of_skulls[| i])
						{
							countdown_decrease()
						}
					}
				
				}
			}
		}
	
	}
	#endregion
}
else
{
	#region bot
	var multiswap_allowed; //if multiswap_allowed is allowed, we dont care if gems are stationary.
	if MyGamerule.multiswap_allowed multiswap_allowed = true
	else
	{
		if MyGamerule.IsGemActive2 multiswap_allowed = true
		else multiswap_allowed = false
	}
	var canmove;
	if !MyGamerule.moving && !MyGamerule.lightOn && MyGamerule.illegal_cando canmove = true
	else canmove = false
	
	if MyGamerule.controlallowed //&& !global.bot1 && Gamerule_1.summoves2 > 0
	{
		var isready = MyGamerule.IsGemActive2
		if (global.botdifficulty1 == 3 && Gamerule_1.multiswap_allowed && global.SET_gamemode != 1) {isready = true; bot_speed = 30}
		if isready && canmove
		{
			if (alarm[1] == -1) alarm[1] = bot_speed
		}
		else alarm[1] = -1
	}
	#endregion
}
/// @description Button checking
#region PHYSICS
	scr_buyo_findij()
	var amlastrow = false
	if (_i == 7 || _i2 == 7) amlastrow = true
	if amlastrow || position_meeting(x,y+32+spd,Gem_1) || position_meeting(x+xx,y+32+yy+spd,Gem_1) //|| (floor((y+spd-Board_1.y+63)/64) == 8) || (floor((y+spd+yy-Board_1.y+63)/64) == 8)
	{
		if !doonce 
		{
			while(!position_meeting(x,y+32,Gem_1) && !position_meeting(x+xx,y+yy+32,Gem_1) && !position_meeting(x+xx,y+yy+32,stopper) && !position_meeting(x,y+32,stopper)) 
			{
				y++
			}
			alarm[0] = 80 div spd
			doonce = true
		}
	}
	else
	{
		alarm[0] = -1
		doonce = false
		y+=spd
	}
#endregion

#region ROTATION
	if keyboard_check_pressed(vk_up) || keyboard_check_pressed(ord("Z")) || keyboard_check_pressed(ord("X")) || gamepad_button_check_pressed_anyface(global.gp[0])
	{
		alarm[0] = -1
		doonce = false
		event_user(0)
	}
#endregion

#region MOVEMENT
	if keyboard_check_pressed(vk_left) || keyboard_check_pressed(vk_right) || gamepad_button_check_pressed(global.gp[0],gp_padl) || gamepad_button_check_pressed(global.gp[0],gp_padr)
	{
		doonce2 = false
		if keyboard_check(vk_left) || gamepad_button_check(global.gp[0],gp_padl)  left = true
		else left = false
		event_user(1)	
		alarm[1] = -1
		doonce = false
	}
	else if (keyboard_check(vk_left) || keyboard_check(vk_right)) || gamepad_button_check(global.gp[0],gp_padl) || gamepad_button_check(global.gp[0],gp_padr)
	{
		if !doonce2
		{
			doonce2 = true
			alarm[1] = 10
		}
	}
	else {doonce2 = false; alarm[1] = -1}
	
	if (keyboard_check(vk_down) || gamepad_button_check(global.gp[0],gp_padd)) && !accidental_down
	{		
		spd = 20		
	}
	else 
	{
		spd = spd_def
	}
	
	if keyboard_check_released(vk_down) || gamepad_button_check_released(global.gp[0],gp_padd) accidental_down = false
#endregion
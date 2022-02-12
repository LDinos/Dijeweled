/// @description Button checking
var B_move_left = keyboard_check(vk_left) || gamepad_button_check(global.gp[0],gp_padl) || mobile_left
var B_move_right = keyboard_check(vk_right) || gamepad_button_check(global.gp[0],gp_padr) || mobile_right
var B_rot_left = (keyboard_check(ord("Z"))) || gamepad_button_check(global.gp[0], gp_face3) || gamepad_button_check(global.gp[0], gp_face4) || mobile_rot_left
var B_rot_right = (keyboard_check(vk_up)) || (keyboard_check(ord("X"))) || gamepad_button_check(global.gp[0], gp_face1) || gamepad_button_check(global.gp[0], gp_face2) || mobile_rot_right
#region PHYSICS
	scr_buyo_findij()
	var amlastrow = false
	if (_i == 7 || _i2 == 7) amlastrow = true
	if position_meeting(x,y+32+spd,Gem_1) || position_meeting(x+xx,y+32+yy+spd,Gem_1) || position_meeting(x+xx,y+yy+spd+32,stopper) || position_meeting(x,y+32+spd,stopper)
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

if (move_endlag > 0) move_endlag--
if (B_move_left) {
	left = true
	if (move_endlag == 0) event_user(1)
} 
else if (B_move_right) {
	left = false
	if (move_endlag == 0) event_user(1)
} 
else {move_endlag = 0; move_endlag_started = false}

if (B_rot_left) {
	ang = 90;
	cond_angle = 270
	else_angle = 0
	if !rot_once_l {event_user(0); rot_once_l = true}
} else rot_once_l = false
if (B_rot_right) {
	ang = -90;
	cond_angle = 0
	else_angle = 270
	if !rot_once_r {event_user(0); rot_once_r = true}
} else rot_once_r = false
if (B_rot_right == false && B_rot_left == false) {rot_once_l = false; rot_once_r = false}

#region FAST MOVEMENT
	
	if (keyboard_check(vk_down) || gamepad_button_check(global.gp[0],gp_padd) || mobile_down) && !accidental_down
	{		
		spd = 20		
	}
	else 
	{
		spd = spd_def
	}
	
	if keyboard_check_released(vk_down) || gamepad_button_check_released(global.gp[0],gp_padd) accidental_down = false
#endregion
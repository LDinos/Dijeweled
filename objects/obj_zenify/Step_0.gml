/// @description Insert description here
// You can write your code in this editor

if mouse_check_pressed_me(mb_left) || keyboard_check_pressed(ord("P")) || gamepad_button_check_pressed(global.gp[0],global.GP_pass)
{
	if index = 99 && !Gamerule_1.levelbarfull && !Gamerule_1.levelcompleted && Gamerule_1.IsGemActive2
	{
		instance_destroy(replay)
		with(Board_1) sprite_index = spr_board_zen
		with(Gem_1) 
		{
			if skinnum != 7
			{
				var gl = instance_create(x,y,obj_zen_gemglow);
				gl.image_index = skinnum
			}
			if (spinning) unspin() 
			sprite_index = spr_zen_gems
		}
		with(player1) {gem2 = noone; gem1 = noone}
		audio_play_sound(snd_pass,0,0)
		Gamerule_1.zenify = true
		was_illegal_allowed_before = Gamerule_1.illegals_allowed
		Gamerule_1.illegals_allowed = true
	}
	else audio_play_sound(snd_xplier_illegal,0,0)
}

if (zenify_points > zenify_points_temp)
{
	var difftoadd = (zenify_points - zenify_points_temp) div 2
	if difftoadd == 0 difftoadd = 1
	zenify_points_temp += difftoadd
}
else if (zenify_points < zenify_points_temp) zenify_points_temp = zenify_points

if Gamerule_1.zenify && !cooldown
{
	c_rainbow = c_white
	index -= 0.20*zen_countdown_multiplier
	if index <= 0
	{	
		with(Board_1) sprite_index = spr_board_default
		with(Gem_1) {if (spinning) {unspin()}; sprite_index = spr_gems; image_index = skinnum; image_speed = 0; anim_happening = false}
		with(player1) {gem2 = noone; gem1 = noone}
		cooldown = true	
		Gamerule_1.zenify = false
		if !was_illegal_allowed_before Gamerule_1.illegals_allowed = false
		index = 0
		with(Gamerule_1) 
		{
			if !moving
			{
			matcher_stepevent(Gem_1)
			IsGemActive2 = 0; 
			IsGemActive = 0; 
			alarm[0] = 1; 
			alarm[1] = -1;
			}
		}		
	}
	index_temp = index
}
else if index >= 99 {c_rainbow = make_color_hsv((timevar+5) mod 255,128,255); timevar++}
else {c_rainbow = c_white; timevar = 0}

if (Gamerule_1.IsGemActive2 && !Gamerule_1.zenify)
{
	if cooldown = true
	{
		cooldown = false
		var combopoints = instance_create(x,y+96, obj_zen_combo)
		combopoints.text = string(zenify_points)
		if Gamerule_1.isQuest
		{
			with(obj_quest_control)
			{
				S_num_zenifycombo += other.zenify_points
			}
		}
	}
}
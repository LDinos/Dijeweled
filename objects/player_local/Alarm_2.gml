/// @description Match animation - after
// You can write your code in this editor
	make_gems_fallen(MyGamerule)
	flag = false
	gemtoexplode1 = noone
	gemtoexplode2 = noone
	with(MyGamerule)
	{
		check_for_xplier = true //check for multiplier increase/decrease on this move (gets to false after matcher_stepevent)
		increase_xplier = false //as default, lets say we did an illegal move (decrease xplier)
	}
	with(gemtomove1) {check_ifmatch(other.MyGamerule)}
	with(gemtomove2) {check_ifmatch(other.MyGamerule)}
	
	if flag
	{
		MyGamerule.chain++
		MyGamerule.blazingchainup = true;
		if !MyGamerule.blazingspeed
		{
			MyGamerule.blazingshouldup = true;
		}
		else
			{
				with(gemtoexplode1) amexplode = true
				with(gemtoexplode2) amexplode = true
			}
		alarm[7] = 3
		MyGamerule.moving = false
		
		with(gemtomove1) 
		{		
			alarm[2] = 2
		}
		with(gemtomove2) 
		{ 
			alarm[2] = 2
		}
	}
	else //if no matches happen
	{
		if Gamerule_1.illegals_allowed {
			MyGamerule.blazingspeedchain = 0
			MyGamerule.blazingspeedtotalchain = 0
		}
		MyGamerule.chain = 0
		audio_play_sound(snd_xplier_illegal,0,0)
		MyGamerule.illegal_cando = false

		if instance_exists(gemtomove1) && instance_exists(gemtomove2)
		{
			temp = gemtomove1
			gemtomove1 = gemtomove2
			gemtomove2 = temp
			if !MyGamerule.illegals_allowed do_match_turnback(MyGamerule)
			else
			{				
				with(MyGem) matchnear = false;
				with(gemtomove1) 
				{	
					alarm[2] = 2
				} 
				with(gemtomove2) 
				{
					alarm[2] = 2
				}
				alarm[7] = 3
				MyGamerule.moving = false
			}
		}
		else {alarm[7] = 3; MyGamerule.moving = false}
		
	}
MyGamerule.replay_illegals_allowed = false	
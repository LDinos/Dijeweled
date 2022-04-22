/// @description Match animation - after
// You can write your code in this editor
	//make_gems_fallen(Gamerule_1)
	//with(Gamerule_1) {update_gems_fallen_array()}
update_skin_array(MyGamerule)
var flag1 = false
var flag2 = false
var reset_gem_ammoving = false
gemtoexplode1 = noone
gemtoexplode2 = noone
with(Gamerule_1)
{
	check_for_xplier = true //check for multiplier increase/decrease on this move (gets to false after matcher_stepevent)
	increase_xplier = false //as default, lets say we did an illegal move (decrease xplier)
}
with(gemtomove1) {flag1 = check_ifmatch(Gamerule_1)}
with(gemtomove2) {flag2 = check_ifmatch(Gamerule_1)}
alarm[7] = 3
if (flag1 || flag2)
{
	reset_gem_ammoving = true
	with(obj_countdown_controller) moves--
	if Gamerule_1.isQuest
	{			
		with(obj_quest_control)
		{
			if (C_movesneeded != S_movesdone) S_movesdone++
			if L_movesleft > 0 L_movesleft--
		}
	}
	Gamerule_1.chain++
	Gamerule_1.blazingchainup = true;
	if !Gamerule_1.blazingspeed
	{
		Gamerule_1.blazingshouldup = true;
	}
	else
		{
			with(gemtoexplode1) amexplode = true
			with(gemtoexplode2) amexplode = true
		}
}
else //if no matches happen
{
	if Gamerule_1.illegals_allowed with(obj_countdown_controller) moves--
	if Gamerule_1.isQuest
	{
		if Gamerule_1.illegals_allowed
		{
				
			with(obj_quest_control)
			{
				if (C_movesneeded != S_movesdone) S_movesdone++
				if L_movesleft > 0 L_movesleft--
			}
		}
		else
		{
			with(obj_quest_control)
			{
				if C_gemsare0 != -1
				{
					checkpoint-- //get back one autosave so undo wont deal with illegal moves
				}
			}
		}
	}
	Gamerule_1.chain = 0
	if !Gamerule_1.zenify audio_play_sound(snd_xplier_illegal,0,0)
	Gamerule_1.illegal_cando = false
	with(Gamerule_1.list_of_doom)
	{
		if !Gamerule_1.zenify audio_play_sound(snd_doom_count,0,0)
		countdown_decrease()
	}
	with(obj_bonus_challenge) bonus_set_index(0)

	if instance_exists(gemtomove1) && instance_exists(gemtomove2)
	{
		temp = gemtomove1
		gemtomove1 = gemtomove2
		gemtomove2 = temp
		if !Gamerule_1.illegals_allowed && !Gamerule_1.replay_illegals_allowed swap_gems_back()
		else reset_gem_ammoving = true
		/*{				
			with(Gem_1) matchnear = false;
			with(gemtomove1) 
			{	
				alarm[2] = 10
			} 
			with(gemtomove2) 
			{
				alarm[2] = 10
			}
		}*/
	}
		
}
if reset_gem_ammoving {
	with(gemtomove1) alarm[2] = 2
	with(gemtomove2) alarm[2] = 2
}
Gamerule_1.replay_illegals_allowed = false	

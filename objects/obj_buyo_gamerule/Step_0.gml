/// @description Insert description here
if check
{
	if Gamerule_1.IsGemActive2
	{
		if Gamerule_1.level	< 20
		{
			var prev_level = Gamerule_1.level		
			Gamerule_1.level = (Gamerule_1.points div 10000) + 1
			if (prev_level != Gamerule_1.level)
			{
				audio_play_sound(snd_closecall,0,false)
				audio_play_sound(snd_lightning_refill,0,false)
				create_textellent("LEVEL UP")
				with(Board_1) {
					image_index++
					alpha = 1
					alarm[2] = 1
				}
				event_user(0) //music
				discord_update_presence(global.DIS_name,"Level " + string(Gamerule_1.level),"ico_512","")
			}
		}
		
		buyo_spawn_gems()

	}
}


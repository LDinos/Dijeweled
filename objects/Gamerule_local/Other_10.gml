/// @description Compliment voices check

	if compliment_points >= 6200
	{
		if !complimentsaid6
		{
			
			audio_group_stop_all(audiogroup_voice)
			if compliments_allowed {create_compliment(6); audio_play_sound(vo_unbelievable,0,0)}
			complimentsaid6 = true
			complimentsaid5 = true
			complimentsaid4 = true
			complimentsaid3 = true
			complimentsaid2 = true
			complimentsaid1 = true
			complimentsaid0 = true
		}
	}
	else if compliment_points >= 4800
	{
		if !complimentsaid5
		{
			
			audio_group_stop_all(audiogroup_voice)
			if compliments_allowed {create_compliment(5);audio_play_sound(choose(vo_extraordinary,vo_extraordinary1),0,0)}
			complimentsaid5 = true
			complimentsaid4 = true
			complimentsaid3 = true
			complimentsaid2 = true
			complimentsaid1 = true
			complimentsaid0 = true
		}
	}
	else if compliment_points >= 3700
	{
		if !complimentsaid4
		{
			
			audio_group_stop_all(audiogroup_voice)
			if compliments_allowed {create_compliment(4); audio_play_sound(choose(vo_spectacular,vo_spectacular1),0,0)}
			complimentsaid4 = true
			complimentsaid3 = true
			complimentsaid2 = true
			complimentsaid1 = true
			complimentsaid0 = true
		}
	}
	else if compliment_points >= 3000
	{
		if !complimentsaid3
		{
			
			audio_group_stop_all(audiogroup_voice)
			if compliments_allowed {create_compliment(3);audio_play_sound(vo_incredible,0,0)}
			complimentsaid3 = true
			complimentsaid2 = true
			complimentsaid1 = true
			complimentsaid0 = true
		}
	}
	else if compliment_points >= 2000
	{
		if !complimentsaid2
		{
			
			audio_group_stop_all(audiogroup_voice)
			if compliments_allowed {create_compliment(2);audio_play_sound(choose(vo_awesome,vo_awesome1),0,0)}
			complimentsaid2 = true
			complimentsaid1 = true
			complimentsaid0 = true
		}
	}
	else if compliment_points >= 1200
	{
		if !complimentsaid1
		{
			
			audio_group_stop_all(audiogroup_voice)
			if compliments_allowed {create_compliment(1);audio_play_sound(choose(vo_excellent,vo_excellent1,vo_excellent2),0,0)}
			complimentsaid1 = true
			complimentsaid0 = true
		}
	}
	else if compliment_points >= 500
	{
		if !complimentsaid0
		{
			
			audio_group_stop_all(audiogroup_voice)
			if compliments_allowed {create_compliment(0);audio_play_sound(choose(vo_good,vo_good1),0,0)}
			complimentsaid0 = true
		}
	}


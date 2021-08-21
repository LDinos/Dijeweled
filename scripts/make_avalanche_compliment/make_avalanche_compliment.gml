function make_avalanche_compliment() {

	if gems_to_send >= 52
	{
		audio_play_sound(vo_unbelievable,false,false)
	}
	else if gems_to_send >= 46
	{
		audio_play_sound(vo_extraordinary,false,false)
	}
	else if gems_to_send >= 38
	{
		audio_play_sound(vo_spectacular,false,false)
	}
	else if gems_to_send >= 30
	{
		audio_play_sound(vo_incredible,false,false)
	}
	else if gems_to_send >= 20
	{
		audio_play_sound(vo_awesome,false,false)
	}
	else if gems_to_send >= 12
	{
		audio_play_sound(vo_excellent,false,false)
	}
	else if gems_to_send > 7
	{
		audio_play_sound(vo_good,false,false)
	}

	if gems_to_send >= 15 audio_play_sound(snd_avalanchebigcombo,0,0)


}

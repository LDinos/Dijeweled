/// @description Increase xplier
if xplier_real != 11
{
	light = 1
	alarm[3] = 1
	audio_play_sound(snd_xplier_up,0,0)
	if Gamerule_1.xplier < 10 Gamerule_1.xplier++
	xplier_real++
	var xplier = Gamerule_1.xplier;
	perc = 0 //percentage for lerp at flow width
	filler = 0 //current filler width
	def_filler = 0 //base filler width
	fill_to_go -= 256 //future fill in lerp function
	if xplier_real = 11 sprite_index = spr_xplier_flow_rainbow
	if xplier <= 4
	{
		bar_gap = (64/xplier)
		bar_sprite = xplier - 1
	}
	else
	{
		bar_gap = 16 //16 pixels per gap
		bar_sprite = 3 //1 bars
	}
}
else
{
	Gamerule_1.xplier = 10
	xplier_real = 10
	perc = 0 //percentage for lerp at flow width
	filler = 0 //current filler width
	def_filler = 0 //base filler width
	fill_to_go -= 256 //future fill in lerp function
	bar_gap = 16 //16 pixels per gap
	bar_sprite = 3 //1 bars
	Gamerule_1.fruit_want_to_spawn = true
}
fill_to_go += bar_gap //fill the first gap when getting to the next xplier


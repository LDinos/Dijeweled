/// @description Drop down
var xplier = Gamerule_1.xplier;
alarm[0] = -1
filler = fill_to_go //just in case the animation wasn't done, finish it
//audio_play_sound(snd_xplier_illegal,0,0)
if filler = 0 || xplier_real = 11//no gaps filled
{
	sprite_index = spr_xplier_flow //in case it was rainbow
	if xplier > 1 //drop only if we are above x1
	{
		audio_play_sound(snd_xplier_fall,0,0)
		if xplier_real != 11 Gamerule_1.xplier--
		xplier_real--
		xplier = Gamerule_1.xplier
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
	
}
perc = 0
def_filler = filler
fill_to_go = 0
alarm[0] = 1

	



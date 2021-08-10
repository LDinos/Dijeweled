//@param indicator_index(0-4)
//0-3 are indexes of indicator
//4 is challenge completion (no position)
if argument0 < 4 && !challenge_complete
{
	bonus_index = argument0
	perc = 0
	xx = indicator_x
	alarm[0] = -1
	alarm[0] = 1
}
else
{
	if !challenge_complete
	{
		bonus_index = 0
		challenge_complete = true
		audio_play_sound(vo_challengecomplete,0,0)
		alarm[1] = 60
		alarm[5] = 90
	}
}
/// @description Insert description here
if instance_exists(mygem)
{
	x = mygem.x + mygem.SWAP_X
	y = mygem.y + mygem.SWAP_Y
	if (timer >= 36)
	{
		Gamerule_1.list_of_doom = mygem
		mygem.amBeingLocked = 0
		mygem.countdown = obj_doom_control.DoomCounter
		mygem.skinnum = 7
		audio_play_sound(snd_doom_count,0,0)
		make_infobox(Gamerule_1.FirstTime_Doom,3)
		instance_destroy()
	}
}
else instance_destroy()

timer++;
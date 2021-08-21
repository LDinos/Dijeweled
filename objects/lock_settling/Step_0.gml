/// @description Insert description here
if instance_exists(mygem)
{
	x = mygem.x + mygem.SWAP_X
	y = mygem.y + mygem.SWAP_Y
	if (image_index = image_number - 1)
	{
		mygem.amBeingLocked = 0
		audio_play_sound(snd_lock_end,0,0)
		make_infobox(Gamerule_1.FirstTime_Lock,0)
		Gamerule_1.FirstTime_Lock = false
		instance_destroy()
	}
}
else instance_destroy()

/// @description Insert description here
if instance_exists(mygem)
{
	x = mygem.x + mygem.SWAP_X
	y = mygem.y + mygem.SWAP_Y
	if (image_index = image_number - 1)
	{
		mygem.amBeingLocked = 0
		audio_play_sound(snd_icelock,0,0)
		with(Gamerule_1)
		{
			if (IsGemActive) {
				if (!gameover)
				{
					destroy_hidden_gems()
					check_for_ice_gems()
				}
			}
		}
		instance_destroy()
		make_infobox(Gamerule_1.FirstTime_Ice,1)
	}
}
else instance_destroy()

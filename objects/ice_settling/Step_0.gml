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
			var l = ds_list_size(list_of_hiddengems)
			for(var i = 0; i<l; i++)
			{
				with(list_of_hiddengems[| i]) delete_gem()
			}
			var l = ds_list_size(list_of_ice_locks)
			for(var i = 0; i<l; i++)
			{
				with(list_of_ice_locks[| i]) ice_create_hiddengems()
			}
		}
		instance_destroy()
		make_infobox(Gamerule_1.FirstTime_Ice,1)
	}
}
else instance_destroy()

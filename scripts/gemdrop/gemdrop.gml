///@param Gem_index
///@description Used on Avalanche Gameover
function gemdrop(argument0) {
	audio_play_sound(snd_gemdrop,0,0)
	with(argument0)
	{
		amInvisible = true;
		gempower = 0
		amHype = false
		drop = instance_create(x,y,gem_drop)
		with(drop){ image_index = other.skinnum}
		//delete_gem()
	}




}

/// @function script()
/// @description default
/// @param {type} param first parameter
function play_gem_hit_sound(){
	if (!audio_is_playing(gem_hit)) {
		audio_play_sound(gem_hit,0,false)
	}
}
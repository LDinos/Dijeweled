// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function buyo_play_music(audio_id){
	var s = audio_play_sound(audio_id,0,1)
	var t = audio_sound_get_track_position(base_music)
	audio_sound_set_track_position(s,t)
}
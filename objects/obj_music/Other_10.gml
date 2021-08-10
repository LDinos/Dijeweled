/// @description Make danger true
isdanger = true
var t = audio_sound_get_track_position(base)
var s = audio_play_sound(mus,1,true)
audio_sound_set_track_position(s,t)
//audio_sound_gain(mus,1*global.VolMus,300)
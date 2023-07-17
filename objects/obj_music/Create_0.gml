/// @description Insert description here
danger_enable = true
doonce = false
base = audio_play_sound(mus_timerunning,0,true)
mus = mus_timerunning_danger
/*sg = audio_create_sync_group(true)
base = audio_play_in_sync_group(sg, mus_timerunning)
mus = mus_timerunning_danger
audio_play_in_sync_group(sg, mus)
audio_sound_gain(mus,0,0)
audio_start_sync_group(sg)*/
isdanger = false
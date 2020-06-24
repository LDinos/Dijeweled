/// @description End challenge
audio_stop_sound(mus_main)
if (danger_enable) audio_stop_sound(mus_danger)

if win audio_play_sound(mus_win,0,false)
else audio_play_sound(mus_loss,0,false)

/// @description tick sound
if acc = 0
{
    alarm[9] = 1
}
else
{
audio_play_sound(tick,0,0)
alarm[9] = 14 - acc 
}


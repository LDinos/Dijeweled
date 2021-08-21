/// @description Victory or death
if victory 
{
	audio_play_sound(bombvictory,0,0)
	alarm[11] = 30
} 
else 
{
	instance_destroy(obj_button_undo); 
	instance_destroy(obj_button_reset); 
	audio_play_sound(snd_bomblose,0,0);
}

ended = true
    if rot <= 22.5 dest = 0 //W1,W2,W3
    else if rot <= 45 dest = 45 //W1,W2
    else if rot <= 67.5 dest = 45 //W1, W2
    else if rot <= 90 dest = 90 //NONE
    else if rot <= 112.5 dest = 90 //NONE
    else if rot <= 135 dest = 135 //W1
    else if rot <= 157.5 dest = 135 //W1
    else if rot <= 180 dest = 180 //W1,W2,W3
alarm[10] = 1
func = 0
yy = y
alarm[6] = 60

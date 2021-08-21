/// @description Insert description here
if obj_CUS_general.canclick
{
	var txt = instance_create(x + sprite_width/2, y - sprite_height/2, obj_issaved)
	if (obj_CUS_objectives.objectives > 0)
	{
		txt.text = "Saved!"
		txt.color = c_white
		alarm[0] = 1
		audio_play_sound(snd_xplier_up,0,false)
	}
	else
	{
		txt.text = "No Objectives found!"
		txt.color = c_red
		audio_play_sound(snd_xplier_illegal,0,false)
	}
}
/// @description also kill the fade
with(obj_fade) alarm[1] = 1
if victory alarm[8] = 10
else
{
	var my_bomb;
	for(var i=0;i<ds_list_size(Gamerule_1.list_of_bombs);i++) {if (Gamerule_1.list_of_bombs[| i].countdown = 0) my_bomb = Gamerule_1.list_of_bombs[| i]}
	audio_play_sound(snd_bombgameover,0,0)
	file_delete("autosave_"+string(room_get_name(room)))
	var ded = instance_create(my_bomb.x,my_bomb.y,obj_bombexplosion)
	ded.image_index = my_bomb.skinnum
	my_bomb.amInvisible = true
}


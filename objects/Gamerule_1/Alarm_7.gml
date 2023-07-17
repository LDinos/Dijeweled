/// @description Create bomb spinner section
if bombis0 && !levelbarfull
{
	var isok = true
	if instance_exists(obj_bonus_challenge)
	{
		if obj_bonus_challenge.challenge_complete isok = false
	}
	
	if (fruit_want_to_spawn || fruit_spawning) isok = false
	if instance_exists(geode) || instance_exists(obj_bombexplosion) isok = false
	
	if isok
	{
		var isok2 = false //is it doom?
		for(var i =0;i<ds_list_size(list_of_bombs);i++) {if (list_of_bombs[| i].countdown = 0) isok2 = true}
		if list_of_doom != noone
		{
			if (list_of_doom.countdown = 0) isok2 = false
		}
		if isok2 && wheel_spinner_allowed instance_create_depth(room_width/2,512,-10,wheel_spinner)
		else
		{
			controlallowed = false
			spawnallowed = false
			autosave_allowed = false
			if isok2 //if its a bomb with bombspinner dissallowed
				{
					//audio_group_stop_all(audiogroup_music)
					with(obj_questmusic) {win = false; event_user(1)}
					file_delete("autosave_"+string(room_get_name(room)))
					audio_play_sound(snd_bombgameover,0,0)
					var my_bomb;
					for(var i =0;i<ds_list_size(list_of_bombs);i++) {if (list_of_bombs[| i].countdown = 0) my_bomb = (list_of_bombs[| i])}
					audio_play_sound(vo_gameover,0,0)
					var ded = instance_create(my_bomb.x,my_bomb.y,obj_bombexplosion)
					ded.image_index = my_bomb.skinnum
					my_bomb.amInvisible = true
				/*file_delete("autosave_rm_timeattack")
				audio_group_stop_all(audiogroup_music)
				room_goto(rm_menu)*/
				}
			else //if its a doom
				{
					file_delete("autosave_"+string(room_get_name(room)))
					audio_play_sound(snd_doomgameover,0,0)
					var my_bomb = list_of_doom
					audio_play_sound(vo_gameover,0,0)
					var ded = instance_create(my_bomb.x,my_bomb.y,obj_bombexplosion)
					ded.sprite_index = spr_doomgem
					my_bomb.amInvisible = true
				}
		}
		IsGemActive = false
		//audio_play_sound(vo_incredible,0,0)
	}
	else alarm[7] = 1
}
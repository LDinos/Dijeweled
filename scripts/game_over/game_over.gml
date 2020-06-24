audio_play_sound(vo_gameover,0,0)
file_delete("autosave_"+string(room_get_name(room)))
audio_group_stop_all(audiogroup_music)
autosave_allowed = false
replay_allowed = false
controlallowed = false
instance_destroy(replay)
instance_create(x,y,obj_gameover)
//room_goto(rm_menu)
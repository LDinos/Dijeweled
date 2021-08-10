amLocked = 0
if Gamerule_1.isQuest with(obj_quest_control) {S_destroyed_ice++}
ds_list_delete(Gamerule_1.list_of_ice_locks,ds_list_find_index(Gamerule_1.list_of_ice_locks,id))

	part_particles_create(global.sys_above_gem, irandom_range(x-8,x+8), y, global.part_icebreak1, 12);
	part_particles_create(global.sys_above_gem, irandom_range(x-8,x+8), irandom_range(y-16,y+16), global.part_lockbreak2, 3);
audio_play_sound(snd_lock_break,0,0)
with(Gamerule_1) points_add_nocombo(50)
create_score_text(x,y+32,50,false,mycolor)
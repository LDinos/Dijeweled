amLocked = 0
if Gamerule_1.isQuest with(obj_quest_control) {S_destroyed_locks++}
ds_list_delete(Gamerule_1.list_of_locks,ds_list_find_index(Gamerule_1.list_of_locks,id))
repeat(5)
{
	part_particles_create(global.sys_above_gem, irandom_range(x-32,x+32), irandom_range(y-16,y+16), global.part_lockbreak1, 1);
	part_particles_create(global.sys_above_gem, irandom_range(x-32,x+32), irandom_range(y-16,y+16), global.part_lockbreak2, 1);
}
audio_play_sound(snd_lock_break,0,0)
with(Gamerule_1) {compliment_add(25); points_add_nocombo(25)}
create_score_text(x,y+32,25,false,mycolor)
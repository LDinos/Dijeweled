amLocked = 0
xmover = 0
ymover = 0
countdown = 20
ds_list_delete(Gamerule_1.list_of_skulls,ds_list_find_index(Gamerule_1.list_of_skulls,id))
if Gamerule_1.isQuest with(obj_quest_control) {S_destroyed_skulls++}
part_particles_create(global.sys_above_gem, x, y, global.doomdestroy, 1);
audio_play_sound(snd_doom_destroy,0,0)
with(Gamerule_1) {compliment_add(50); points_add_nocombo(50)}
create_score_text(x,y+32,50,false,mycolor)

//with(obj_xplier) event_user(0) //fill in one gap
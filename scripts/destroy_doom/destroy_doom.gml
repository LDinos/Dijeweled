amLocked = 0
xmover = 0
ymover = 0
countdown = 20
Gamerule_1.list_of_doom = noone
if Gamerule_1.isQuest with(obj_quest_control) {S_destroyed_dooms++}
part_particles_create(global.sys_above_gem, x, y, global.doomdestroy, 1);
audio_play_sound(snd_doom_destroy,0,0)
if instance_exists(obj_xplier) instance_create(x,y,obj_doom_sperms)
with(Gamerule_1) {compliment_add(100); points_add_nocombo(100)}
create_score_text(x,y+32,100,false,mycolor)
//with(obj_xplier) event_user(0) //fill in one gap
magnify(x,y,false)
amBomb = false
xmover = 0
ymover = 0
countdown = 20
if Gamerule_1.isQuest with(obj_quest_control) {S_destroyed_bombs++}
ds_list_delete(Gamerule_1.list_of_bombs,ds_list_find_index(Gamerule_1.list_of_bombs,id))
part_particles_create(global.sys_above_gem, x, y, global.part_BombSmoke, 3);
part_particles_create(global.sys_above_gem, x, y, global.part_BombSmoke2, 3);
audio_play_sound(snd_bombexplosion,0,0)
repeat(5)
{
	var shard  = instance_create(x,y,obj_shard)
	shard.color = mycolor
}
with(obj_xplier) event_user(0) //fill in one gap
with(Gamerule_1) {points_add_nocombo(50); compliment_add(50)}
create_score_text(x,y+32,50,false,mycolor)
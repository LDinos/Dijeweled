/// @description Make the lock
if instance_exists(mygem)
{
ds_list_add(Gamerule_1.list_of_skulls,mygem)
mygem.amLocked = 4
//instance_create(x,y,doom_settling)
mygem.amBeingLocked = 0
mygem.countdown = obj_skull_control.SkullCounter + obj_skull_control.SkullCounter*mygem._i
mygem.skinnum = 7
audio_play_sound(snd_doom_count,0,0)
make_infobox(Gamerule_1.FirstTime_Skull,4)
}
instance_destroy(id,false)



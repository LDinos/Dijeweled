/// @description Make the lock
mygem.amLocked = 1
ds_list_add(Gamerule_1.list_of_locks,mygem)
instance_create(x,y,lock_settling)
instance_destroy(id,false)



/// @description Insert description here
audio_stop_all()
instance_activate_object(obj_music)
instance_activate_object(obj_particles)
instance_activate_object(Gamerule_1)
instance_activate_object(obj_xplier)
if !Gamerule_1.isQuest room_goto(rm_menu)
else room_goto(rm_menu_challenges)
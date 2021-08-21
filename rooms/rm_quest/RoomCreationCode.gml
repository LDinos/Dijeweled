room_speed = 60
draw_texture_flush()
/*These Gamerule variables will always be false in quests, no matter what*/
Gamerule_1.levelcompleteallowed = false
Gamerule_1.compliments_allowed = false
Gamerule_1.replay_allowed = false
Gamerule_1.autosave_allowed = false
/*-*/
instance_create(0,0,obj_questmusic)
load_custom_quest(false) //read quest (that is not customly made)
//mus0 = mus_timerunning (survivor/avalanche music, use takeyourtimewin and takeyourtimeloss for mus_win and mus_loss)
//mus1 = mus_takeyourtime (available for all parts)
//mus2 = mus_challenge1 (available for all parts)
//mus3 = mus_challenge2 (available for all parts)

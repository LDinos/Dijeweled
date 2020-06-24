/* Desc

Fruit just after it got matched, includes shake animation,
waits for other fruit to be destroyed.

*/
if Gamerule_1.isQuest with(obj_quest_control)
{
	S_destroyed_fruits++
}
modifier = 1
if Gamerule_1.isReplay modifier = 1.5
depth = -98
grav = 0.5;
vsp = 1;
movespeed = 4;
image_xscale = .5
image_yscale = .5
started = false
image_speed = 0
shake = 6
started = true
audio_play_sound(fruit_explosion,1,0)
Gamerule_1.fruit_exploding = true //for not checking isgemactive
Gamerule_1.fruit_exploding_dontmove = true //for gems not to move
alarm[4] = 50
alarm[0] = 140
alarm[6] = 140
alarm[3] = 1
instance_create_depth(0,0,depth+1,obj_fade)
/* */
/*  */

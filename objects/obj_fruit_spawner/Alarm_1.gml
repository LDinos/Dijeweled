/// @description Insert description here
func += 0.02
x = lerp(xx, gotox, func)
y = lerp(yy, gotoy, func)

if func < 1 alarm[1] = 1
else
{
	with(gotoobject)
	{
		if spinning {sprite_index = spr_gems; image_index = skinnum; image_speed = 0}
		if amBeingLocked != 0 {amBeingLocked = 0; instance_destroy(instance_position(x,y,lockAppear)); instance_destroy(instance_position(x,y,doomAppear))}
		if amBomb destroy_bomb()
		else if amLocked = 1 destroy_lock()
		gempower = 6
	}
	with(Gamerule_1)
	{
		if bombis0
		{
			var setitback = true
			for(var i = 0; i < ds_list_size(list_of_bombs); i++)
			{
				if list_of_bombs[| i].countdown = 0 setitback = false
			}
			if setitback bombis0 = false
		}
	}
	Gamerule_1.fruit_spawning = false
	audio_play_sound(fruitappear2,0,0)
	if Gamerule_1.isQuest obj_quest_control.S_num_fruits++
	instance_destroy()
}
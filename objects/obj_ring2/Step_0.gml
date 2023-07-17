timevar+=0.2
col1 = make_color_hsv((timevar+5) mod 255,128,255)
with(Gem_1)
{
	if instance_place(x,y,other)
	{
		if amLocked = 1 destroy_lock()
		else if amBeingLocked = 1 instance_destroy(instance_position(x,y,lockAppear))
		if skinnum = other.killing
		{
		
				part_particles_create_color(global.sys_above_gem,x,y,global.part_fruit_break_sparkles,c_white,12)
				audio_play_sound(rowblow,0,0)
				create_col = false
				if gempower != 6
				{
					with(Gamerule_1) {points_add_nocombo(25); compliment_add(25)}
					create_score_text(x,y,25,false,mycolor)
					instance_destroy()
					delete_gem()
				}
				else
				{
					ds_list_delete(Gamerule_1.list_of_fruits,ds_list_find_index(Gamerule_1.list_of_fruits,id))
					gempower = 1
					if Gamerule_1.isQuest with(obj_quest_control)
					{
						S_destroyed_fruits++
					}
					with(Gamerule_1) {points_add_nocombo(1000); compliment_add(300)}
					create_score_text_big(x,y,1000,false)
					instance_destroy()
					delete_gem()
				}	
		}
	}
	
}



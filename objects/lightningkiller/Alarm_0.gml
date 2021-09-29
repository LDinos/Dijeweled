/// @description lightning
//if skinnum = -1 show_message("MY SKIN IS BAD")
gem[0] = noone
gem[1] = noone
gem[2] = noone
gem[3] = noone
if w_count <= 7
{
	var gem0 = instance_position(x-(w_count*64),y,Gem_1)
	var gem1 = instance_position(x+(w_count*64),y,Gem_1)
	var gem2 = instance_position(x,y+(w_count*64),Gem_1)
	var gem3 = instance_position(x,y-(w_count*64),Gem_1)
    if gem0 != noone
	{
		gem[0] = gem0
	}
    
    if gem1 != noone
	{
    gem[1] = gem1
	}
    
    if gem2 != noone
	{
        gem[2] = gem2
	}
    
    if gem3 != noone
    {
		gem[3] = gem3
	}
    
    for(i=0;i<=3;i++)
    {       
        with(gem[i]) 
        {
            if amLit && !amInvisible
            {
				magnify(x,y,false)
				if amHype
				{
					gem_to_hype = id
					skin_to_hype = other.skinnum
					if instance_exists(player1) {if (player1.gem1 == id) player1.gem1 = noone}
					instance_destroy()
				}
				else if gempower != FRUIT
				{
		            part_particles_create_colour(global.sys_above_gem,x,y,global.gemsmoketype,mycolor,8)
		            part_particles_create(global.sys_above_gem,irandom_range(x-32,x+32),irandom_range(y-32,y+32),global.gemsmokesparkle,irandom_range(6,10))                
		            with(Gamerule_1) {points_add_nocombo(20); compliment_add(30) style_add(20,false)}
					create_score_text_big(other.x,other.y,20,false)
					audio_play_sound(snd_gemdestroyed,0,0)
					create_col = false
					make_inv_dis = true
		            instance_destroy()  
				}
				else
				{
					if !amFruitExploding
					{
						ds_list_add(Gamerule_1.list_of_fruits,other.gem[other.i])
					}
					amFruitExploding = true
					
				}
            }
        }
        
    }
    w_count++
    alarm[0] = 8*modifier
    
}
        


///@param Gem
///@param gempower
///@param Gamerule
function make_power(argument0, argument1, argument2) {

	gl = instance_create(x,y,gem_glow)
	with(gl) {image_index = other.skinnum; depth = other.depth-1}

#region quest
	if Gamerule_1.isQuest with(obj_quest_control)
			{
				switch(argument1)
				{
					case 1: S_num_flames++ break;
					case 2: S_num_lights++ break;
					case 3: S_num_novas++ break;
					case 4: S_num_novas++; S_num_septas++ break;
					case 5: S_num_novas++; S_num_septas++; S_num_octas++ break;
				}
			}
#endregion

	if gempower = 0 && !amexplode
	    {
			if Gamerule_1.isQuest with(obj_quest_control) {S_matched_gems++}
			if global.online
			{
				with(global.mynet)
				{
					buffer_seek(buffer,buffer_seek_start,0)
					buffer_write(buffer,buffer_u8,NN_MATCH_GEM_POWER)
					buffer_write(buffer,buffer_u8,other.myid)
					buffer_write(buffer,buffer_u8,argument1)
					network_send_packet(client_socket,buffer,buffer_tell(buffer))
				}
			}
			with(obj_avalanchedeposit) {if hidden_gems > 0 {hidden_gems--}; event_user(0); }
			with(obj_avalanchedeposit_local) {if hidden_gems > 0 {hidden_gems--}; event_user(0); }
			with(argument2) gemdestroyonemove++		
			if amBeingLocked > 0
			{
				instance_destroy(instance_position(x,y,doomAppear))
				instance_destroy(instance_position(x,y,lockAppear))
				instance_destroy(instance_position(x,y,iceAppear))
				instance_destroy(instance_position(x,y,skullAppear))
				destroy_lock()
				instance_destroy(instance_position(x,y,doom_settling))
				instance_destroy(instance_position(x,y,lock_settling))
				instance_destroy(instance_position(x,y,ice_settling))
				amLocked = 0
			}
			if amBomb destroy_bomb()
			else if amLocked = 1 destroy_lock()
			else if amLocked = 3 destroy_ice_lock()
	        gempower = argument1
			instance_create(x,y,obj_gemoutlines)
	        //gemout = instance_create(x,y,obj_gemoutlines)
	        //gemout.image_index = skinnum
	        amPowered = true
			//ds_list_add(Gamerule_1.list_of_ampowered,id)
			ds_list_add(argument2.list_of_ampowered,id)
	    }
	else 
	    {
			if amexplode
				{
					explode(argument0)
					amexplode = false
				}
			
			create_col = false
			instance_destroy()
		
	        newpower = instance_create(x,y,argument0)
			with(newpower) set_skin(other.skinnum)
	        newpower.gempower = argument1
			newpower.myid = myid
			idtosend = newpower.myid
			powertosend = newpower.gempower
	        with(newpower)
	        { 
				instance_create(x,y,obj_gemoutlines)
				amPowered = true
				ds_list_add(argument2.list_of_ampowered,id)
				if global.online
				{
					scr_add_gemid(Gamerule_1)
					with(global.mynet)
					{
						buffer_seek(buffer,buffer_seek_start,0)
						buffer_write(buffer,buffer_u8,NN_MATCH_GEM_POWER_NEW)
						buffer_write(buffer,buffer_u8,other._i)
						buffer_write(buffer,buffer_u8,other._j)
						buffer_write(buffer,buffer_u8,other.skinnum)
						buffer_write(buffer,buffer_u8,other.gempower)
						network_send_packet(client_socket,buffer,buffer_tell(buffer))
					}				
				}
			
	        }
	        //gemout = instance_create(x,y,obj_gemoutlines)
	        //gemout.image_index = newflame.skinnum     
	    }




}

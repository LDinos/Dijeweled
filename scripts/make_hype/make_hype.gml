///@description A 5 match will trigger this
///@param Gem
///@param Gamerule
function make_hype(argument0, argument1) {
	if Gamerule_1.isQuest with(obj_quest_control) {S_num_hypes++}
	if gempower = 0 && !amexplode
	    {
		#region online
			if global.online
			{
				with(global.mynet)
				{
					buffer_seek(buffer,buffer_seek_start,0)
					buffer_write(buffer,buffer_u8,NN_MATCH_GEM_HYPER)
					buffer_write(buffer,buffer_u8,other.myid)
					network_send_packet(client_socket,buffer,buffer_tell(buffer))
				}
			}
		#endregion
			with(obj_avalanchedeposit) {if hidden_gems > 0 {hidden_gems--};event_user(0);}
			with(obj_avalanchedeposit_local) {if hidden_gems > 0 {hidden_gems--};event_user(0);}	
	        gempower = 0
			if Gamerule_1.isQuest with(obj_quest_control) {S_matched_gems++}
			ds_list_add(argument1.list_of_ampowered,id)		
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
	        amPowered = true
			amHype = true
			skinnum = 7
			if amBomb destroy_bomb()
			else if amLocked = 1 destroy_lock()
			else if amLocked = 3 destroy_ice_lock()
	    }
	else 
	    {
			if amexplode
				{
					explode(argument0)
					amexplode = false
				}
	        newflame = instance_create(x,y,argument0)
	        newflame.skinnum = skinnum
	        newflame.image_index = skinnum
	        newflame.gempower = 0
			newflame.myid = myid
			instance_destroy()
			idtosend = newflame.myid
			powertosend = newflame.gempower
	        with(newflame)
	        { 
				ds_list_add(argument1.list_of_ampowered,id)
				skinnum = 7
				amPowered = true
				amHype = true
			#region online
				if global.online
				{
					scr_add_gemid(Gamerule_1)
					with(global.mynet)
					{
						buffer_seek(buffer,buffer_seek_start,0)
						buffer_write(buffer,buffer_u8,NN_MATCH_GEM_HYPER_NEW)
						buffer_write(buffer,buffer_u8,other._i)
						buffer_write(buffer,buffer_u8,other._j)
						network_send_packet(client_socket,buffer,buffer_tell(buffer))
					}				
				}
			#endregion
	        }   
	    }



}

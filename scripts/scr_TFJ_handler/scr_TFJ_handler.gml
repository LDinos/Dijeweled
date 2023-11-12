function scr_TFJ_handler(req){
	var req_split=string_split(req, "|")
	switch(req_split[0])
	{
		case "LBS": //lobbies
			instance_destroy(obj_tfj_lobby_master)
			var lobby_master = instance_create(0,0,obj_tfj_lobby_master)
			global.canbepressed = true
			obj_menu_tooltip.text = obj_menu_tooltip.deftext
			if (array_length(req_split) == 1) break
			var lobbies =  string_split(req_split[1], "/")
			for (var i=0;i<array_length(lobbies);i++)
			{
				var attributes=string_split(lobbies[i],"?")
				array_push(lobby_master.lobbies,{"name": attributes[0], "host": attributes[1]})
			}
			lobby_master.refresh_lobby_info()
		break
			
		case "LBJ": ///lebron james (lobby join)
			show_debug_message(req_split[1])
			if (req_split[1]) room_goto(rm_TFJeweled_lobby)
		break
		
		case "ULP": //update lobby participants
			if (array_length(req_split) == 1) break //in case you're alone :(
			obj_tfj_inlobby_renderer.generateSelfSlot()
			var players=string_split(req_split[1], "/")
			for (var i=0;i<array_length(players);i++)
			{
				obj_tfj_inlobby_renderer.lobby_slots[i+1].name=""
				var players_split = string_split(players[i], "?") 
				obj_tfj_inlobby_renderer.lobby_slots[i+1].name=players_split[0]
				if (i==0 && !global.IAMHOST){obj_tfj_inlobby_renderer.lobby_slots[i+1].name = "Host: " + obj_tfj_inlobby_renderer.lobby_slots[i+1].name;break;}
				obj_tfj_inlobby_renderer.lobby_slots[i+1].name+= " - "
				obj_tfj_inlobby_renderer.lobby_slots[i+1].name+=players_split[1] == true ? "READY" : "NOT READY"
			}
		break
		
		case "LDH":
			room_goto(rm_menu)
			show_message("Disconnected by the host")
		break
	}
}
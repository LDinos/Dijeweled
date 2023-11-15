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
			if (req_split[1]) room_goto(rm_TFJeweled_lobby)
		break
		
		case "ULP": //update lobby participants
		{
			if (array_length(req_split) == 1) break //in case you're alone :(
			with (obj_button_tfj_lobby_button_start) {disabled = false}
			obj_tfj_inlobby_renderer.generateSelfSlot()
			var players=string_split(req_split[1], "/")
			for (var i=0;i<array_length(players);i++)
			{
				obj_tfj_inlobby_renderer.lobby_slots[i+1].name=""
				var players_split = string_split(players[i], "?") 
				obj_tfj_inlobby_renderer.lobby_slots[i+1].name=players_split[0]
				obj_tfj_inlobby_renderer.lobby_slots[i+1].ready_status=players_split[1]
				if (i==0 && !global.IAMHOST){obj_tfj_inlobby_renderer.lobby_slots[i+1].host = true;return;}
				if (global.IAMHOST) 
				{
					if (obj_tfj_inlobby_renderer.lobby_slots[i+1].ready_status==false) {with (obj_button_tfj_lobby_button_start) {disabled = true}}
				}
			}
		}
		break
		
		case "LDH":
			room_goto(rm_menu)
			show_message("Disconnected by the host")
		break
		
		case "SRT":
			room_goto(rm_tfj)
		break
		
		case "FPO":
		{
			var params=string_split(req_split[1], "/")
			obj_tfj_ingame_renderer.players[params[0]].is_me=true
			for (var i=0;i<array_length(params)-1;i++) //should be 8
			{
				obj_tfj_ingame_renderer.players[i].setName(params[i+1])
			}
			obj_tfj_client.sendRequest("INI|"+scr_board_to_string(spawner1_tfj.gem_array))
		}
		break
		
		case "EOR": //EOR|part0board?part0gold?part0hp/part1board?part1gold...
		{
			var params = string_split(req_split[1], "/")
			var params2;
			for (var i=0;i<array_length(params);i++) //should be 8
			{
				params2 = string_split(params[i], "?")
				scr_string_to_board(params2[0],obj_tfj_ingame_renderer.players[i].board)
				obj_tfj_ingame_renderer.players[i].gold=params2[1]
				obj_tfj_ingame_renderer.players[i].hp=params2[2]
			}
		}
		break
	}
}
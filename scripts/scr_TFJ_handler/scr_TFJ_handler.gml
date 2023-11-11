
function scr_TFJ_handler(req){
	var req_split=string_split(req, "|")
	switch(req_split[0])
	{
		case "LBS": //lobbies
			var lobby_master = instance_create(0,0,obj_tfj_lobby_master)
			if (array_length(req_split) == 1) break
			var lobbies =  string_split(req_split[1], "/")
			for (var i=0;i<array_length(lobbies);i++)
			{
				var attributes=string_split(lobbies[i],"?")
				array_push(lobby_master.lobbies,{"name": attributes[0], "host": attributes[1]})
			}
			lobby_master.refresh_lobby_info()
		break
			
		case "LBJ":
			if (req_split[1]) room_goto(rm_TFJeweled_lobby)
		break
		
		case "ULP":
			if (array_length(req_split) == 1) break //in case you're alone :(
			var players=string_split(req_split[1], "/")
			for (var i=0;i<array_length(players);i++)
			{
				obj_tfj_inlobby_renderer.lobby_slots[i+1].name=""
				if (i==0 && !global.IAMHOST){obj_tfj_inlobby_renderer.lobby_slots[i+1].name = "Host: "}
				obj_tfj_inlobby_renderer.lobby_slots[i+1].name+=players[i]
			}
		break
	}
}
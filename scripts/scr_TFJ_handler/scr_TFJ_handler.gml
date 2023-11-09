// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function scr_TFJ_handler(req){
	var req_split=string_split(req, ":")
	switch(req_split[0])
	{
		case "LBS": //lobbies
			var lobby_master = instance_create(0,0,obj_tfj_lobby_master)
			var lobbies =  string_split(req_split[1], "/")
			for (var i=0;i<array_length(lobbies);i++)
			{
				var attributes=string_split(lobbies[i],"?")
				array_push(lobby_master.lobbies,{"name": attributes[0], "host": attributes[1]})
			}
			lobby_master.refresh_lobby_info()
			break
	}
}
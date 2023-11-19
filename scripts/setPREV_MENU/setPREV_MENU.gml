// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function setPREV_MENU(room_id){
	global.PREV_MENU="initial"
	var roomStruct = 
	{	"rm_menu_challenges": "single",
		"rm_ipjoin": "online",
		"rm_lobby": "online",
		"rm_lobby_local": "play",
		"rm_lobby_local": "play",
		"rm_ONLINE": "online",
		"rm_TFJeweled_lobby": "tfjeweled"
	}
	if (roomStruct[$ room_get_name(room_id)] != undefined)
	{
		global.PREV_MENU=roomStruct[$ room_get_name(room_id)]
	}
}
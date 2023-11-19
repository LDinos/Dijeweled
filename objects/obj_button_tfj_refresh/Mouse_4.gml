if global.canbepressed
{
	global.canbepressed = false
	obj_tfj_client.sendRequest("LBS")
	obj_menu_tooltip.text="Fetching lobbies..."
	//values reset at script
}
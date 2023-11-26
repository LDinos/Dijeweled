if (obj_tfj_ingame_renderer.my_player().gold>=2)
{
	obj_tfj_ingame_renderer.my_player().gold-=2
	obj_tfj_client.sendRequest("RRL")
}
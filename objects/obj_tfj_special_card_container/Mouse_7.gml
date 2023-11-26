if (card[1]<=obj_tfj_ingame_renderer.my_player().gold)
{
	obj_tfj_client.sendRequest("BUY|"+card[0]+"?"+card[1])
	with (obj_tfj_ingame_renderer)
	{
		my_player().gold-=other.card[1]
		my_player().cards[my_player().cards_count]=other.card[0]
		my_player().cards_count++
	}
	obj_tfj_ingame_special_button.removeCard(id)
	instance_destroy()
}





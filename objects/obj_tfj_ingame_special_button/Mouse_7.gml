if (clickable)
{
	clickable=false
	sm = instance_create(280,550,obj_tfj_special_main)

	//FOR SHOP ROUNDS
	if (!what_to_draw)
	{
		//spawn reroll button
		instance_create_depth(sm.x+sm.sprite_width/2-sprite_get_width(spr_tfj_reroll)/2,sm.y+sm.sprite_height-16-sprite_get_height(spr_tfj_reroll),sm.depth-1,obj_tfj_special_reroll)
		
		if (!array_length(assigned_cards))
		{
			obj_tfj_client.sendRequest("CRD")
			exit;
		}
		for (var i=0;i<array_length(assigned_cards);i++)
		{
			array_push(cards,instance_create_depth(sm.x+100+i*sprite_get_width(spr_tfj_cards)+i*50,sm.y+100,sm.depth-1,obj_tfj_special_card_container))
		}
		setCards()
	}
}


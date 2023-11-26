what_to_draw=obj_tfj_ingame_renderer.special_round=="S" ? 0 : 1
clickable=true
//FOR SHOP ROUNDS
assigned_cards=[]
cards = []
sm = undefined // special main refference


function setCards()
{
	for (var i=0;i<array_length(cards);i++)
	{
		cards[i].setCard(assigned_cards[i])
	}
}

function removeCard(someID)
{
	for (var i=0; i<array_length(cards);i++)
	{
		if(cards[i]==someID)
		{
			array_delete(assigned_cards,i,1)
			array_delete(cards,i,1)
			return
		}
	}
}

function create3CardSlots ()
{
	instance_destroy(obj_tfj_special_card_container)
	cards= []
	array_push(cards,instance_create_depth(sm.x+100,sm.y+100,sm.depth-1,obj_tfj_special_card_container))
	array_push(cards,instance_create_depth(sm.x+100+sprite_get_width(spr_tfj_cards)+50,sm.y+100,sm.depth-1,obj_tfj_special_card_container))
	array_push(cards,instance_create_depth(sm.x+100+2*sprite_get_width(spr_tfj_cards)+2*50,sm.y+100,sm.depth-1,obj_tfj_special_card_container))
}
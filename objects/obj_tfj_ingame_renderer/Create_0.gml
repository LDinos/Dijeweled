players=[]
rounds = []
room_start_y=515
current_round=0

//spawn the player slots on the left
for (var i=0;i<8;i++)
{
	array_push(players,instance_create(32, room_start_y+100+(sprite_get_height(spr_TFJ_ingame_player)+font_get_size(font0)+8)*i,obj_tfj_ingame_player))
}
obj_tfj_client.sendRequest("FPO")
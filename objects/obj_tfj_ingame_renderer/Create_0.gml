players=[]
special_round="S" 
me=0
room_start_y=515
current_round=0
timer=10

//spawn the player slots on the left
for (var i=0;i<8;i++)
{
	array_push(players,instance_create(32, room_start_y+100+(sprite_get_height(spr_TFJ_ingame_player)+font_get_size(font0)+8)*i,obj_tfj_ingame_player))
}
obj_tfj_client.sendRequest("FPO")

function set_timer(time)
{
	timer=time
}

function my_player()
{
	return players[me]
}

function next_round()
{
	if (current_round==4) current_round=0;return
	current_round++
}

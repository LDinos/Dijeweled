/// create inlobby_playerslots
lobby_slots=[]
i_am_ready=false
function generateSelfSlot()
{
	lobby_slots[0].name= global.user
	if (global.IAMHOST) {lobby_slots[0].host = true ;return }
	lobby_slots[0].ready_status=i_am_ready
}


var middle_column=room_width*0.4
var left_column=room_width*0.1
var right_column=room_width*0.7

for (var i=1;i<3;i++)
{
	array_push(lobby_slots,instance_create(middle_column,(room_height/4)*(i%2)+160,obj_tfj_inlobby_playerslot))
}

for (var i=1;i<4;i++)
{
	array_push(lobby_slots,instance_create(left_column,(room_height/4)*(i%3)+160,obj_tfj_inlobby_playerslot))
}

for (var i=1;i<4;i++)
{
	array_push(lobby_slots,instance_create(right_column,(room_height/4)*(i%3)+160,obj_tfj_inlobby_playerslot))
}

generateSelfSlot()

var lobby_ready_x=sprite_get_width(spr_TFJ_lobby_slot)-sprite_get_width(spr_base_button)/2+middle_column
var lobby_ready_y=(room_height/4)*2+160+sprite_get_height(spr_TFJ_lobby_slot)/2-sprite_get_height(spr_base_button)/4

if (global.IAMHOST)
{
	instance_create(lobby_ready_x,lobby_ready_y,obj_button_tfj_lobby_button_start)
}
else
{
	instance_create(lobby_ready_x,lobby_ready_y,obj_button_tfj_lobby_button_ready)
}

instance_create(middle_column,lobby_ready_y,obj_button_tfj_lobby_button_back)
obj_tfj_client.sendRequest("ULP") 




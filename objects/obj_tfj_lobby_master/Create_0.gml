/// @description Insert description here
// You can write your code in this editor
lobbies = []
lobby_buttons = []
page=0
for (var i=0;i<4;i++)
{
	array_push(lobby_buttons, instance_create(room_width-16-sprite_get_width(spr_TFJ_lobby), 100+sprite_get_height(spr_TFJ_lobby)*i+15*i, obj_tfj_lobby_slot) )
}

function refresh_lobby_info()
{
	for (var i=0;i<4;i++)
	{
		if ( i+page*4 < array_length(lobbies) )
		{
			lobby_buttons[i].name=lobbies[i+page*4].name
			lobby_buttons[i].host=lobbies[i+page*4].host
			lobby_buttons[i].is_pressable=true
		}
		else
		{
			lobby_buttons[i].name=""
			lobby_buttons[i].host=""
		}
	}
}
selected_lobby = undefined